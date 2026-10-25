struct CameraUniform {
    view_proj: mat4x4<f32>,
};
@group(0) @binding(0)
var<uniform> camera: CameraUniform;

struct VertexInput {
    @location(0) position: vec3<f32>,
    @location(1) tex_coords: vec2<f32>,
};
struct InstanceInput {
    @location(5) model_matrix_0: vec4<f32>,
    @location(6) model_matrix_1: vec4<f32>,
    @location(7) model_matrix_2: vec4<f32>,
    @location(8) model_matrix_3: vec4<f32>,
};
struct VertexOutput {
    @builtin(position) clip_position: vec4<f32>,
    @location(0) height: f32,
    @location(1) depth: f32,
};

const BASE_COLOR = vec3<f32>(0.05, 0.25, 0.04);
const TIP_COLOR = vec3<f32>(0.45, 0.80, 0.20);
const FADE_NEAR: f32 = 1.0;
const FADE_FAR: f32 = 10.0;
const MIN_BRIGHTNESS: f32 = 0.08;

@vertex
fn vs_main(model: VertexInput, instance: InstanceInput) -> VertexOutput {
    let model_matrix = mat4x4<f32>(
        instance.model_matrix_0,
        instance.model_matrix_1,
        instance.model_matrix_2,
        instance.model_matrix_3,
    );
    let clip = camera.view_proj * model_matrix * vec4<f32>(model.position, 1.0);

    var out: VertexOutput;
    out.clip_position = clip;
    out.height = model.tex_coords.y;
    out.depth = clip.w;
    return out;
}

@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
    let color = mix(BASE_COLOR, TIP_COLOR, in.height);
    let fade = smoothstep(FADE_NEAR, FADE_FAR, in.depth);
    let brightness = mix(1.0, MIN_BRIGHTNESS, fade);
    return vec4<f32>(color * brightness, 1.0);
}
