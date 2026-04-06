# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# The workflow lists custom nodes in an unknown registry with no aux_id (GitHub) provided, so they could not be auto-resolved or installed.
# Could not resolve unknown_registry node 'LoadImage' - no aux_id provided, skipping
# Could not resolve unknown_registry node 'CLIPTextEncode' - no aux_id provided, skipping
# Could not resolve unknown_registry node 'CLIPTextEncode' - no aux_id provided, skipping
# Could not resolve unknown_registry node 'EmptyLatentImage' - no aux_id provided, skipping
# Could not resolve unknown_registry node 'KSampler' - no aux_id provided, skipping
# Could not resolve unknown_registry node 'VAEDecode' - no aux_id provided, skipping
# Could not resolve unknown_registry node 'UpscaleModelLoader' - no aux_id provided, skipping
# Could not resolve unknown_registry node 'ImageUpscaleWithModel' - no aux_id provided, skipping

# download models into comfyui
RUN comfy model download --url https://huggingface.co/Kim2091/UltraSharp/resolve/main/4x-UltraSharp.pth --relative-path models/upscale_models --filename 4x-UltraSharp.pth

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
