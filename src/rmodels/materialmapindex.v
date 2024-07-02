module rcore

enum MaterialMapIndex {
	material_map_albedo     = 0
	material_map_metalness
	material_map_normal
	material_map_roughness
	material_map_occlusion
	material_map_emission
	material_map_height
	material_map_cubemap
	material_map_irradiance
	material_map_prefilter
	material_map_brdf
}

const material_map_diffuse = MaterialMapIndex.material_map_albedo
const material_map_specular = MaterialMapIndex.material_map_metalness
