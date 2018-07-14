{.deadCodeElim: on.}
when not defined(release):
  {.passC: "-D_DEBUG".}
when defined(macosx):
  {.passL: "-framework OpenGL -framework Foundation".}
elif defined(windows):
  {.compile: "native/glad.c".}

  proc gladLoadGL*(): cint {.importc: "gladLoadGL",cdecl.}
else:
  {.passL: "-lGL".}
{.compile: "native/sokol.c".}
type
  buffer* {.pure.} = object
    id*: uint32

  image* {.pure.} = object
    id*: uint32

  shader* {.pure.} = object
    id*: uint32

  pipeline* {.pure.} = object
    id*: uint32

  pass* {.pure.} = object
    id*: uint32

  context* {.pure.} = object
    id*: uint32

const
  INVALID_ID* = 0
  NUM_SHADER_STAGES* = 2
  NUM_INFLIGHT_FRAMES* = 2
  MAX_COLOR_ATTACHMENTS* = 4
  MAX_SHADERSTAGE_BUFFERS* = 4
  MAX_SHADERSTAGE_IMAGES* = 12
  MAX_SHADERSTAGE_UBS* = 4
  MAX_UB_MEMBERS* = 16
  MAX_VERTEX_ATTRIBUTES* = 16
  MAX_MIPMAPS* = 16
  MAX_CUBEMAP_FACES* = 6
  MAX_TEXTUREARRAY_LAYERS* = 128

type
  feature* = enum
    FEATURE_INSTANCING,
    FEATURE_TEXTURE_COMPRESSION_DXT,
    FEATURE_TEXTURE_COMPRESSION_PVRTC,
    FEATURE_TEXTURE_COMPRESSION_ATC,
    FEATURE_TEXTURE_COMPRESSION_ETC2,
    FEATURE_TEXTURE_FLOAT,
    FEATURE_TEXTURE_HALF_FLOAT,
    FEATURE_ORIGIN_BOTTOM_LEFT,
    FEATURE_ORIGIN_TOP_LEFT,
    FEATURE_MSAA_RENDER_TARGETS,
    FEATURE_PACKED_VERTEX_FORMAT_10_2,
    FEATURE_MULTIPLE_RENDER_TARGET,
    FEATURE_IMAGETYPE_3D,
    FEATURE_IMAGETYPE_ARRAY, NUM_FEATURES

type
  resource_state* = enum
    RESOURCESTATE_INITIAL,
    RESOURCESTATE_ALLOC,
    RESOURCESTATE_VALID,
    RESOURCESTATE_FAILED,
    RESOURCESTATE_INVALID,
    RESOURCESTATE_FORCE_U32 = 0x7FFFFFFF


type
  usage* = enum
    USAGE_DEFAULT,
    USAGE_IMMUTABLE,
    USAGE_DYNAMIC,
    USAGE_STREAM,
    USAGE_NUM,
    USAGE_FORCE_U32 = 0x7FFFFFFF

type
  buffer_type* = enum
    BUFFERTYPE_DEFAULT,
    BUFFERTYPE_VERTEXBUFFER,
    BUFFERTYPE_INDEXBUFFER,
    BUFFERTYPE_NUM,
    BUFFERTYPE_FORCE_U32 = 0x7FFFFFFF

type
  index_type* = enum
    INDEXTYPE_DEFAULT,
    INDEXTYPE_NONE,
    INDEXTYPE_UINT16,
    INDEXTYPE_UINT32,
    INDEXTYPE_NUM,
    INDEXTYPE_FORCE_U32 = 0x7FFFFFFF

type
  image_type* = enum
    IMAGETYPE_DEFAULT,
    IMAGETYPE_2D,
    IMAGETYPE_CUBE,
    IMAGETYPE_3D,
    IMAGETYPE_ARRAY,
    IMAGETYPE_NUM,
    IMAGETYPE_FORCE_U32 = 0x7FFFFFFF

type
  cube_face* = enum
    CUBEFACE_POS_X,
    CUBEFACE_NEG_X,
    CUBEFACE_POS_Y,
    CUBEFACE_NEG_Y,
    CUBEFACE_POS_Z,
    CUBEFACE_NEG_Z,
    CUBEFACE_NUM

type
  shader_stage* = enum
    SHADERSTAGE_VS,
    SHADERSTAGE_FS
    SHADERSTAGE_FORCE_U32 = 0x7FFFFFFF

type
  pixel_format* = enum
    PIXELFORMAT_DEFAULT,
    PIXELFORMAT_NONE,
    PIXELFORMAT_RGBA8,
    PIXELFORMAT_RGB8,
    PIXELFORMAT_RGBA4,
    PIXELFORMAT_R5G6B5,
    PIXELFORMAT_R5G5B5A1,
    PIXELFORMAT_R10G10B10A2,
    PIXELFORMAT_RGBA32F,
    PIXELFORMAT_RGBA16F,
    PIXELFORMAT_R32F,
    PIXELFORMAT_R16F,
    PIXELFORMAT_L8,
    PIXELFORMAT_DXT1,
    PIXELFORMAT_DXT3,
    PIXELFORMAT_DXT5,
    PIXELFORMAT_DEPTH,
    PIXELFORMAT_DEPTHSTENCIL,
    PIXELFORMAT_PVRTC2_RGB,
    PIXELFORMAT_PVRTC4_RGB,
    PIXELFORMAT_PVRTC2_RGBA,
    PIXELFORMAT_PVRTC4_RGBA,
    PIXELFORMAT_ETC2_RGB8,
    PIXELFORMAT_ETC2_SRGB8,
    PIXELFORMAT_NUM,
    PIXELFORMAT_FORCE_U32 = 0x7FFFFFFF

type
  primitive_type* = enum
    PRIMITIVETYPE_DEFAULT,
    PRIMITIVETYPE_POINTS,
    PRIMITIVETYPE_LINES,
    PRIMITIVETYPE_LINE_STRIP,
    PRIMITIVETYPE_TRIANGLES,
    PRIMITIVETYPE_TRIANGLE_STRIP,
    PRIMITIVETYPE_NUM,
    PRIMITIVETYPE_FORCE_U32 = 0x7FFFFFFF

type
  filter* = enum
    FILTER_DEFAULT,
    FILTER_NEAREST,
    FILTER_LINEAR,
    FILTER_NEAREST_MIPMAP_NEAREST,
    FILTER_NEAREST_MIPMAP_LINEAR,
    FILTER_LINEAR_MIPMAP_NEAREST,
    FILTER_LINEAR_MIPMAP_LINEAR,
    FILTER_NUM,
    FILTER_FORCE_U32 = 0x7FFFFFFF

type
  wrap* = enum
    WRAP_DEFAULT,
    WRAP_REPEAT,
    WRAP_CLAMP_TO_EDGE,
    WRAP_MIRRORED_REPEAT,
    WRAP_NUM,
    WRAP_FORCE_U32 = 0x7FFFFFFF

type
  vertex_format* = enum
    VERTEXFORMAT_INVALID,
    VERTEXFORMAT_FLOAT,
    VERTEXFORMAT_FLOAT2,
    VERTEXFORMAT_FLOAT3,
    VERTEXFORMAT_FLOAT4,
    VERTEXFORMAT_BYTE4,
    VERTEXFORMAT_BYTE4N,
    VERTEXFORMAT_UBYTE4,
    VERTEXFORMAT_UBYTE4N,
    VERTEXFORMAT_SHORT2,
    VERTEXFORMAT_SHORT2N,
    VERTEXFORMAT_SHORT4,
    VERTEXFORMAT_SHORT4N,
    VERTEXFORMAT_UINT10_N2,
    VERTEXFORMAT_NUM,
    VERTEXFORMAT_FORCE_U32 = 0x7FFFFFFF

type
  vertex_step* = enum
    VERTEXSTEP_DEFAULT,
    VERTEXSTEP_PER_VERTEX,
    VERTEXSTEP_PER_INSTANCE,
    VERTEXSTEP_NUM,
    VERTEXSTEP_FORCE_U32 = 0x7FFFFFFF

type
  uniform_type* = enum
    UNIFORMTYPE_INVALID,
    UNIFORMTYPE_FLOAT,
    UNIFORMTYPE_FLOAT2,
    UNIFORMTYPE_FLOAT3,
    UNIFORMTYPE_FLOAT4,
    UNIFORMTYPE_MAT4,
    UNIFORMTYPE_NUM,
    UNIFORMTYPE_FORCE_U32 = 0x7FFFFFFF

type
  cull_mode* = enum
    CULLMODE_DEFAULT,
    CULLMODE_NONE,
    CULLMODE_FRONT,
    CULLMODE_BACK,
    CULLMODE_NUM,
    CULLMODE_FORCE_U32 = 0x7FFFFFFF

type
  face_winding* = enum
    FACEWINDING_DEFAULT,
    FACEWINDING_CCW,
    FACEWINDING_CW,
    FACEWINDING_NUM,
    FACEWINDING_FORCE_U32 = 0x7FFFFFFF

type
  compare_func* = enum
    COMPAREFUNC_DEFAULT,
    COMPAREFUNC_NEVER,
    COMPAREFUNC_LESS,
    COMPAREFUNC_EQUAL,
    COMPAREFUNC_LESS_EQUAL,
    COMPAREFUNC_GREATER,
    COMPAREFUNC_NOT_EQUAL,
    COMPAREFUNC_GREATER_EQUAL,
    COMPAREFUNC_ALWAYS,
    COMPAREFUNC_NUM,
    COMPAREFUNC_FORCE_U32 = 0x7FFFFFFF

type
  stencil_op* = enum
    STENCILOP_DEFAULT,
    STENCILOP_KEEP,
    STENCILOP_ZERO,
    STENCILOP_REPLACE,
    STENCILOP_INCR_CLAMP,
    STENCILOP_DECR_CLAMP,
    STENCILOP_INVERT,
    STENCILOP_INCR_WRAP,
    STENCILOP_DECR_WRAP,
    STENCILOP_NUM,
    STENCILOP_FORCE_U32 = 0x7FFFFFFF

type
  blend_factor* = enum
    BLENDFACTOR_DEFAULT,
    BLENDFACTOR_ZERO,
    BLENDFACTOR_ONE,
    BLENDFACTOR_SRC_COLOR,
    BLENDFACTOR_ONE_MINUS_SRC_COLOR,
    BLENDFACTOR_SRC_ALPHA,
    BLENDFACTOR_ONE_MINUS_SRC_ALPHA,
    BLENDFACTOR_DST_COLOR,
    BLENDFACTOR_ONE_MINUS_DST_COLOR,
    BLENDFACTOR_DST_ALPHA,
    BLENDFACTOR_ONE_MINUS_DST_ALPHA,
    BLENDFACTOR_SRC_ALPHA_SATURATED,
    BLENDFACTOR_BLEND_COLOR,
    BLENDFACTOR_ONE_MINUS_BLEND_COLOR,
    BLENDFACTOR_BLEND_ALPHA,
    BLENDFACTOR_ONE_MINUS_BLEND_ALPHA,
    BLENDFACTOR_NUM,
    BLENDFACTOR_FORCE_U32 = 0x7FFFFFFF

type
  blend_op* = enum
    BLENDOP_DEFAULT,
    BLENDOP_ADD,
    BLENDOP_SUBTRACT,
    BLENDOP_REVERSE_SUBTRACT,
    BLENDOP_NUM,
    BLENDOP_FORCE_U32 = 0x7FFFFFFF

type
  color_mask* = enum
    COLORMASK_DEFAULT = 0,
    COLORMASK_R = 1,
    COLORMASK_G = 2,
    COLORMASK_B = 4,
    COLPRMASK_RGB = 0x7,
    COLORMASK_A = 8,
    COLORMASK_RGBA = 0xF,
    COLORMASK_NONE = 0x10 ##  special value for 'all channels disabled
    COLORMASK_FORCE_U32 = 0x7FFFFFFF

type
  action* = enum
    ACTION_DEFAULT,
    ACTION_CLEAR,
    ACTION_LOAD,
    ACTION_DONTCARE,
    ACTION_NUM,
    ACTION_FORCE_U32=0x7FFFFFFF

type
  color_attachment_action* {.pure.} = object
    action*: action
    val*: array[4, cfloat]

  depth_attachment_action* {.pure.} = object
    action*: action
    val*: cfloat

  stencil_attachment_action* {.pure.} = object
    action*: action
    val*: uint8

  pass_action* {.pure.} = object
    start_canary: uint32
    colors*: array[MAX_COLOR_ATTACHMENTS, color_attachment_action]
    depth*: depth_attachment_action
    stencil*: stencil_attachment_action
    end_canary: uint32

type
  draw_state* {.pure.} = object
    start_canary: uint32
    pipeline*: pipeline
    vertex_buffers*: array[MAX_SHADERSTAGE_BUFFERS, buffer]
    vertex_buffer_offsets*: array[MAX_SHADERSTAGE_BUFFERS, uint32]
    index_buffer*: buffer
    index_buffer_offset*: uint32
    vs_images*: array[MAX_SHADERSTAGE_IMAGES, image]
    fs_images*: array[MAX_SHADERSTAGE_IMAGES, image]
    end_canary: uint32

type
  desc* {.pure.} = object
    start_canary: uint32
    buffer_pool_size*: cint
    image_pool_size*: cint
    shader_pool_size*: cint
    pipeline_pool_size*: cint
    pass_pool_size*: cint      ##  GL specific
    gl_force_gles2*: bool      ##  Metal-specific
    mtl_device*: pointer
    context_pool_size*: cint
    mtl_renderpass_descriptor_cb*: proc (): pointer
    mtl_drawable_cb*: proc (): pointer
    mtl_global_uniform_buffer_size*: cint
    mtl_sampler_cache_size*: cint ##  D3D11-specific
    d3d11_device*: pointer
    d3d11_device_context*: pointer
    d3d11_render_target_view_cb*: proc (): pointer
    d3d11_depth_stencil_view_cb*: proc (): pointer
    end_canary: uint32

type
  buffer_desc* {.pure.} = object
    start_canary: uint32
    size*: cint
    `type`*: buffer_type
    usage*: usage
    content*: pointer          ##  GL specific
    gl_buffers*: array[NUM_INFLIGHT_FRAMES, uint32] ##  Metal specific
    mtl_buffers*: array[NUM_INFLIGHT_FRAMES, pointer] ##  D3D11 specific
    d3d11_buffer*: pointer
    end_canary: uint32

type
  subimage_content* {.pure.} = object
    content*: pointer          ##  pointer to subimage data
    size*: cint                ##  size in bytes of pointed-to subimage data

type
  image_content* {.pure.} = object
    subimage*: array[MAX_MIPMAPS*MAX_CUBEMAP_FACES, subimage_content]

type
  image_desc* {.pure.} = object
    start_canary: uint32
    `type`*: image_type
    render_target*: bool
    width*: cint
    height*: cint
    slices*: cint
    num_mipmaps*: cint
    usage*: usage
    pixel_format*: pixel_format
    sample_count*: cint
    min_filter*: filter
    mag_filter*: filter
    wrap_u*: wrap
    wrap_v*: wrap
    wrap_w*: wrap
    max_anisotropy*: uint32
    min_lod*: cfloat
    max_lod*: cfloat
    content*: image_content ##  GL specific
    gl_textures*: array[NUM_INFLIGHT_FRAMES, uint32] ##  Metal specific
    mtl_textures*: array[NUM_INFLIGHT_FRAMES, pointer] ##  D3D11 specific
    d3d11_texture*: pointer
    end_canary: uint32

type
  uniform_desc* {.pure.} = object
    name*: cstring
    `type`*: uniform_type
    array_count*: cint

  uniform_block_desc* {.pure.} = object
    size*: cint
    uniforms*: array[MAX_UB_MEMBERS, uniform_desc]

  shader_image_desc* {.pure.} = object
    name*: cstring
    `type`*: image_type

  stage_desc* {.pure.} = object
    source*: cstring
    byte_code*: ptr uint8
    byte_code_size*: cint
    entry*: cstring
    uniform_blocks*: array[MAX_SHADERSTAGE_UBS, uniform_block_desc]
    images*: array[MAX_SHADERSTAGE_IMAGES, shader_image_desc]

  shader_desc* {.pure.} = object
    start_canary: uint32
    vs*: stage_desc
    fs*: stage_desc
    end_canary: uint32

type
  buffer_layout_desc* {.pure.} = object
    stride*: cint
    step_func*: vertex_step
    step_rate*: cint

  attr_desc* {.pure.} = object
    name*: cstring
    sem_name*: cstring
    sem_index*: cint
    buffer_index*: cint
    offset*: cint
    format*: vertex_format

  layout_desc* {.pure.} = object
    buffers*: array[MAX_SHADERSTAGE_BUFFERS, buffer_layout_desc]
    attrs*: array[MAX_VERTEX_ATTRIBUTES, attr_desc]

  stencil_desc* {.pure.} = object
    fail_op*: stencil_op
    depth_fail_op*: stencil_op
    pass_op*: stencil_op
    compare_func*: compare_func

  depth_stencil_desc* {.pure.} = object
    stencil_front*: stencil_desc
    stencil_back*: stencil_desc
    depth_compare_func*: compare_func
    depth_write_enabled*: bool
    stencil_enabled*: bool
    stencil_read_mask*: uint8
    stencil_write_mask*: uint8
    stencil_ref*: uint8

  blend_desc* {.pure.} = object
    enabled*: bool
    src_factor_rgb*: blend_factor
    dst_factor_rgb*: blend_factor
    op_rgb*: blend_op
    src_factor_alpha*: blend_factor
    dst_factor_alpha*: blend_factor
    op_alpha*: blend_op
    color_write_mask*: uint8
    color_attachment_count*: cint
    color_format*: pixel_format
    depth_format*: pixel_format
    blend_color*: array[4, cfloat]

  rasterizer_desc* {.pure.} = object
    alpha_to_coverage_enabled*: bool
    cull_mode*: cull_mode
    face_winding*: face_winding
    sample_count*: cint
    depth_bias*: cfloat
    depth_bias_slope_scale*: cfloat
    depth_bias_clamp*: cfloat

  pipeline_desc* {.pure.} = object
    start_canary: uint32
    layout*: layout_desc
    shader*: shader
    primitive_type*: primitive_type
    index_type*: index_type
    depth_stencil*: depth_stencil_desc
    blend*: blend_desc
    rasterizer*: rasterizer_desc
    end_canary: uint32

type
  attachment_desc* {.pure.} = object
    image*: image
    mip_level*: cint
    slice: cint

  pass_desc* {.pure.} = object
    start_canary: uint32
    color_attachments*: array[MAX_COLOR_ATTACHMENTS, attachment_desc]
    depth_stencil_attachment*: attachment_desc
    end_canary: uint32

# private functions
proc sg_setup(desc: ptr desc) {.importc:"sg_setup",cdecl.}
proc sg_make_buffer(desc: ptr buffer_desc): buffer {.importc:"sg_make_buffer",cdecl.}
proc sg_make_image(desc: ptr image_desc): image {.importc:"sg_make_image",cdecl.}
proc sg_make_shader(desc: ptr shader_desc): shader {.importc:"sg_make_shader",cdecl.}
proc sg_make_pipeline(desc: ptr pipeline_desc): pipeline {.importc:"sg_make_pipeline",cdecl.}
proc sg_make_pass(desc: ptr pass_desc): pass {.importc:"sg_make_pass",cdecl.}
proc sg_update_image(img: image; data: ptr image_content) {.importc:"sg_update_image",cdecl.}
proc sg_begin_default_pass(pass_action: ptr pass_action, width: cint, height: cint) {.importc:"sg_begin_default_pass",cdecl.}
proc sg_begin_pass(pass: pass; pass_action: ptr pass_action) {.importc:"sg_begin_pass",cdecl.}
proc sg_apply_draw_state(ds: ptr draw_state) {.importc:"sg_apply_draw_state",cdecl.}
proc sg_init_buffer(buf_id: buffer; desc: ptr buffer_desc) {.importc:"sg_init_buffer",cdecl.}
proc sg_init_image(img_id: image; desc: ptr image_desc) {.importc:"sg_init_image",cdecl.}
proc sg_init_shader(shd_id: shader; desc: ptr shader_desc) {.importc:"sg_init_shader",cdecl.}
proc sg_init_pipeline(pip_id: pipeline; desc: ptr pipeline_desc) {.importc:"sg_init_pipeline",cdecl.}
proc sg_init_pass(pass_id: pass; desc: ptr pass_desc) {.importc:"sg_init_pass",cdecl.}

# public functions
proc setup*(desc: desc) =
  sg_setup(unsafeAddr(desc))
proc shutdown*() {.importc:"sg_shutdown",cdecl.}
proc isvalid*(): bool {.importc:"sg_isvalid",cdecl.}
proc query_feature*(feature: feature): bool {.importc:"sg_query_feature",cdecl.}
proc reset_state_cache*() {.importc:"sg_reset_state_cache",cdecl.}
proc make_buffer*(desc: buffer_desc): buffer =
  sg_make_buffer(unsafeAddr(desc))
proc make_image*(desc: image_desc): image =
  sg_make_image(unsafeAddr(desc))
proc make_shader*(desc: shader_desc): shader =
  sg_make_shader(unsafeAddr(desc))
proc make_pipeline*(desc: pipeline_desc): pipeline =
  sg_make_pipeline(unsafeAddr(desc))
proc make_pass*(desc: pass_desc): pass =
  sg_make_pass(unsafeAddr(desc))
proc destroy_buffer*(buf: buffer) {.importc:"sg_destroy_buffer",cdecl.}
proc destroy_image*(img: image) {.importc:"sg_destroy_image",cdecl.}
proc destroy_shader*(shd: shader) {.importc:"sg_destroy_shader",cdecl.}
proc destroy_pipeline*(pip: pipeline) {.importc:"sg_destroy_pipeline",cdecl.}
proc destroy_pass*(pass: pass) {.importc:"sg_destroy_pass",cdecl.}
proc update_buffer*(buf: buffer, data_ptr: pointer, data_size: cint) {.importc:"sg_update_buffer",cdecl.}
proc update_buffer*(buf: buffer, data_ptr: pointer, data_size: int) =
  update_buffer(buf, data_ptr, data_size.cint)
proc update_image*(img: image, data: image_content) =
    sg_update_image(img, unsafeAddr(data))
proc query_buffer_state*(buf: buffer): resource_state {.importc:"sg_query_buffer_state",cdecl.}
proc query_image_state*(img: image): resource_state {.importc:"sg_query_image_state",cdecl.}
proc query_shader_state*(shd: shader): resource_state {.importc:"sg_query_shader_state",cdecl.}
proc query_pipeline_state*(pip: pipeline): resource_state {.importc:"sg_query_pipeline_state",cdecl.}
proc query_pass_state*(pass: pass): resource_state {.importc:"sg_query_pass_state",cdecl.}
proc begin_default_pass*(pass_action: pass_action, width: cint, height: cint) =
    sg_begin_default_pass(unsafeAddr(pass_action), width, height)
proc begin_default_pass*(pass_action: pass_action, width: int, height: int) =
    sg_begin_default_pass(unsafeAddr(pass_action), width.cint, height.cint)
proc begin_pass*(pass: pass, pass_action: pass_action) =
    sg_begin_pass(pass, unsafeAddr(pass_action))
proc apply_viewport*(x: cint, y: cint, width: cint, height: cint, origin_top_left: bool) {.importc:"sg_apply_viewport",cdecl.}
proc apply_viewport*(x: int, y: int, width: int, height: int, origin_top_left: bool) =
    apply_viewport(x.cint, y.cint, width.cint, height.cint, origin_top_left)
proc apply_scissor_rect*(x: cint, y: cint, width: cint, height: cint, origin_top_left: bool) {.importc:"sg_apply_scissor_rect",cdecl.}
proc apply_scissor_rect*(x: int, y: int, width: int, height: int, origin_top_left: bool) =
    apply_scissor_rect(x.cint, y.cint, width.cint, height.cint, origin_top_left)
proc apply_draw_state*(ds: draw_state) =
    sg_apply_draw_state(unsafeAddr(ds))
proc apply_uniform_block*(stage: shader_stage; ub_index: cint; data: pointer; num_bytes: cint) {.importc:"sg_apply_uniform_block",cdecl.}
proc apply_uniform_block*(stage: shader_stage; ub_index: int; data: pointer; num_bytes: int) =
    apply_uniform_block(stage, ub_index.cint, data, num_bytes.cint)
proc draw*(base_element: cint; num_elements: cint; num_instances: cint) {.importc:"sg_draw",cdecl.}
proc draw*(base_element: int; num_elements: int; num_instances: int) =
    draw(base_element.cint, num_elements.cint, num_instances.cint)
proc end_pass*() {.importc:"sg_end_pass",cdecl.}
proc commit*() {.importc:"sg_commit",cdecl.}
proc alloc_buffer*(): buffer {.importc:"sg_alloc_buffer",cdecl.}
proc alloc_image*(): image {.importc:"sg_alloc_image",cdecl.}
proc alloc_shader*(): shader {.importc:"sg_alloc_shader",cdecl.}
proc alloc_pipeline*(): pipeline {.importc:"sg_alloc_pipeline",cdecl.}
proc alloc_pass*(): pass {.importc:"sg_alloc_pass",cdecl.}
proc init_buffer*(buf_id: buffer, desc: buffer_desc) =
    sg_init_buffer(buf_id, unsafeAddr(desc))
proc init_image*(img_id: image; desc: var image_desc) =
    sg_init_image(img_id, unsafeAddr(desc))
proc init_shader*(shd_id: shader; desc: shader_desc) =
    sg_init_shader(shd_id, unsafeAddr(desc))
proc init_pipeline*(pip_id: pipeline; desc: pipeline_desc) =
    sg_init_pipeline(pip_id, unsafeAddr(desc))
proc init_pass*(pass_id: pass; desc: var pass_desc) =
    sg_init_pass(pass_id, unsafeAddr(desc))
proc fail_buffer*(buf_id: buffer) {.importc:"sg_fail_buffer",cdecl.}
proc fail_image*(img_id: image) {.importc:"sg_fail_image",cdecl.}
proc fail_shader*(shd_id: shader) {.importc:"sg_fail_shader",cdecl.}
proc fail_pipeline*(pip_id: pipeline) {.importc:"sg_fail_pipeline",cdecl.}
proc fail_pass*(pass_id: pass) {.importc:"sg_fail_pass",cdecl.}
proc setup_context*(): context {.importc:"sg_setup_context", cdecl.}
proc activate_context*(ctx_id: context) {.importc:"sg_activate_context", cdecl.}
proc discard_context*(ctx_id: context) {.importc:"sg_discard_context", cdecl.}

# construction helpers
proc `%`*(items: openArray[uniform_block_desc]): array[MAX_SHADERSTAGE_UBS, uniform_block_desc] =
    for index,item in items.pairs:
        result[index] = item

proc `%`*(items: openArray[uniform_desc]): array[MAX_UB_MEMBERS, uniform_desc] =
    for index,item in items.pairs:
        result[index] = item

proc `%`*(items: openArray[shader_image_desc]): array[MAX_SHADERSTAGE_IMAGES, shader_image_desc] =
    for index,item in items.pairs:
        result[index] = item

proc `%`*(items: openArray[buffer_layout_desc]): array[MAX_SHADERSTAGE_BUFFERS, buffer_layout_desc] =
    for index,item in items.pairs:
        result[index] = item

proc `%`*(items: openArray[attr_desc]): array[MAX_VERTEX_ATTRIBUTES, attr_desc] =
    for index, item in items.pairs:
        result[index] = item

proc `%`*(items: openArray[buffer]): array[MAX_SHADERSTAGE_BUFFERS, buffer] =
    for index, item in items.pairs:
        result[index] = item

proc `%`*(items: openArray[image]): array[MAX_SHADERSTAGE_IMAGES, image] =
    for index, item in items.pairs:
        result[index] = item

proc `%`*(items: openArray[color_attachment_action]): array[MAX_COLOR_ATTACHMENTS, color_attachment_action] =
    for index, item in items.pairs:
        result[index] = item

proc `%`*(items: openArray[subimage_content]): array[MAX_CUBEMAP_FACES*MAX_MIPMAPS, subimage_content] =
    for index, item in items.pairs:
        result[index] = item

proc `%`*(items: openArray[attachment_desc]): array[MAX_COLOR_ATTACHMENTS, attachment_desc] =
    for index, item in items.pairs:
        result[index] = item