GDPC                P                                                                         P   res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn�1      �      A;�t-�]qM��D    X   res://.godot/exported/133200997/export-8f2dd19d5636782311f5e9475e3887f8-checkpoint.scn        C      J��T�]m��_�p�    T   res://.godot/exported/133200997/export-9bd5710ce042774748b0d0537062e337-char_new.scn0      {      �i��U��!o=�%�-    P   res://.godot/exported/133200997/export-f7f08bc39a535487989e6c251f5e40c8-char.scn�      �      ��gJY{��e��K�    X   res://.godot/exported/133200997/export-f948428d5540b70143f2270483c56391-killer_box.scn  �-      �      �-5s�|������Zys    X   res://.godot/exported/133200997/export-fd9bf08f4a38c63924b951fcf3548550-ground_box.scn  `      �      I=(C>���m@�H�B    ,   res://.godot/global_script_class_cache.cfg  p:             ��Р�8���8~$}P�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex0       �      �Yz=������������       res://.godot/uid_cache.bin  P>      �       [��x��g*�`���       res://char.gd           �      +�of���[j����       res://char.tscn.remap   �7      a       !�;��w��;8��X       res://char_new.gd   �      w      ս�JDL���]Y �       res://char_new.tscn.remap   @8      e       _��KMe�Km�y�xu�       res://checkpoint.gd �      T       ��^-���Y�fM
��       res://checkpoint.tscn.remap �8      g        y�/> ��^Byu��q       res://ground_box.tscn.remap  9      g       H��6���*�I��       res://icon.svg  �:      �      C��=U���^Qu��U3       res://icon.svg.import   -      �       �X>]��}��E 1�       res://killer_box.tscn.remap �9      g       o�B|U�`�����sx,       res://main.tscn.remap    :      a       �J�Sw� ������       res://project.binary0?      \      �Ҥh&o;�zO�{39D            extends RigidBody2D

var rot_vel = 4.0
var bounce_vel = 600.0

func _process(delta: float) -> void:
	var rot_v = 0.0
	if Input.is_action_pressed("ui_left"):
		rot_v = -rot_vel*delta
	if Input.is_action_pressed("ui_right"):
		rot_v = rot_vel*delta
	if rot_v != 0:
		rotate(rot_v)


func _on_body_entered(body: Node) -> void:
	if not bounce_id.is_valid():
		print("dead")
		get_tree().call_deferred("reload_current_scene")

func get_bounce_imp():
	var v = Vector2.UP
	return v.rotated(rotation)*bounce_vel

var bounce_id = RID()
func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	bounce_id = body_rid
	print("bounce start")
	var imp = get_bounce_imp()
	linear_velocity = Vector2.ZERO
	set_axis_velocity(imp)
	print(imp)

func _on_area_2d_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body_rid == bounce_id:
		print("bounce end")
		bounce_id = RID()
             RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   friction    rough    bounce 
   absorbent    script    custom_solver_bias    radius    height 	   _bundled       Script    res://char.gd ��������      local://PhysicsMaterial_vasms �         local://CapsuleShape2D_kavkx �         local://CircleShape2D_m5fjp 4         local://PackedScene_v1cyt ^         PhysicsMaterial             CapsuleShape2D             A	        �A         CircleShape2D            �@         PackedScene    
      	         names "         Char    collision_layer    collision_mask    physics_material_override    lock_rotation    continuous_cd    max_contacts_reported    contact_monitor    script    RigidBody2D 
   Polygon2D    polygon    CollisionShape2D 	   position    shape 	   Camera2D    position_smoothing_enabled    Polygon2D2    Area2D    _on_body_entered    body_entered    _on_area_2d_body_shape_entered    body_shape_entered    _on_area_2d_body_shape_exited    body_shape_exited    	   variants                                                   %         �  p�      ��   A  P�   A   A   �   A
         ��         
     �?   @%        ��  �A  ��  �@  @@  �@  �@  �A       
         `A               node_count             nodes     U   ��������	       ����                                                                
   
   ����                           ����                                 ����                     
      ����      	      
                     ����                                ����                         conn_count             conns                                                                                       node_paths              editable_instances              version             RSRC    extends CharacterBody2D

var spawn = Vector2.ZERO
var rot_vel = 7.0
var bounce_vel = 550.0
var gravity = Vector2.DOWN*981

func _process(delta: float) -> void:
	var rot_v = 0.0
	if Input.is_action_pressed("ui_left"):
		rot_v = -rot_vel*delta
	if Input.is_action_pressed("ui_right"):
		rot_v = rot_vel*delta
	if rot_v != 0:
		rotate(rot_v)
	velocity += gravity*delta
	move_and_slide()

func get_bounce_imp():
	var v = Vector2.UP
	return v.rotated(rotation)*bounce_vel


func _on_body_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if not bounce_id.is_valid():
		print("dead")
		position = spawn
		rotation = 0
		velocity = Vector2.ZERO

var bounce_id = RID()
func _on_bouncer_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	bounce_id = body_rid
	print("bounce start")
	var imp = get_bounce_imp()
	velocity = imp
	print(imp)

func _on_bouncer_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body_rid == bounce_id:
		print("bounce end")
		set_deferred("bounce_id", RID())
         RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    radius    script    height 	   _bundled       Script    res://char_new.gd ��������      local://CircleShape2D_xibbm �         local://CircleShape2D_m5fjp �         local://CapsuleShape2D_tsq22          local://PackedScene_w0k1q .         CircleShape2D            A         CircleShape2D            �@         CapsuleShape2D            A         PackedScene          	         names "         Char    collision_layer    collision_mask    script    CharacterBody2D 
   Polygon2D    polygon    CollisionShape2D 	   position    shape 	   Camera2D    position_smoothing_enabled    Polygon2D2    Bouncer    Area2D    Body    _on_bouncer_body_shape_entered    body_shape_entered    _on_bouncer_body_shape_exited    body_shape_exited    _on_body_body_shape_entered    	   variants                              %         �  ��      ��   A  ��   A   A   �   A
         ��                
     �?   @%        ��  �A  ��  �@  @@  �@  �@  �A      
         pA               
         ��               node_count    	         nodes     a   ��������       ����                                        ����                           ����         	                  
   
   ����                           ����                                 ����            	                    ����      
   	                        ����                                ����         	                conn_count             conns                                                                                      node_paths              editable_instances              version             RSRC     extends Area2D

func _on_body_entered(body: Node2D) -> void:
	body.spawn = position
            RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script    res://checkpoint.gd ��������      local://RectangleShape2D_wbbj0 V         local://PackedScene_akytm w         RectangleShape2D             PackedScene          	         names "         Checkpoint    collision_layer    collision_mask    script    Area2D    CollisionShape2D    shape 
   Polygon2D    color    polygon    _on_body_entered    body_entered    	   variants                                                    �?���>%         �   �   A   �   A   A   �   A      node_count             nodes     !   ��������       ����                                        ����                           ����         	                conn_count             conns                   
                    node_paths              editable_instances              version             RSRC             RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled           local://RectangleShape2D_yir78 +         local://PackedScene_rktff \         RectangleShape2D       
     HB  HB         PackedScene          	         names "   	   
   GroundBox    collision_layer    collision_mask    StaticBody2D    CollisionShape2D 	   position    shape 
   Polygon2D    polygon    	   variants                   
     �A  �A          %                HB      HB  HB      HB      node_count             nodes        ��������       ����                                  ����                                 ����                   conn_count              conns               node_paths              editable_instances              version             RSRC         GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
ScI_L �;����In#Y��0�p~��Z��m[��N����R,��#"� )���d��mG�������ڶ�$�ʹ���۶�=���mϬm۶mc�9��z��T��7�m+�}�����v��ح����mow�*��f�&��Cp�ȑD_��ٮ}�)� C+���UE��tlp�V/<p��ҕ�ig���E�W�����Sթ�� ӗ�A~@2�E�G"���~ ��5tQ#�+�@.ݡ�i۳�3�5�l��^c��=�x�Н&rA��a�lN��TgK㼧�)݉J�N���I�9��R���$`��[���=i�QgK�4c��%�*�D#I-�<�)&a��J�� ���d+�-Ֆ
��Ζ���Ut��(Q�h:�K��xZ�-��b��ٞ%+�]�p�yFV�F'����kd�^���:[Z��/��ʡy�����EJo�񷰼s�ɿ�A���N�O��Y��D��8�c)���TZ6�7m�A��\oE�hZ�{YJ�)u\a{W��>�?�]���+T�<o�{dU�`��5�Hf1�ۗ�j�b�2�,%85�G.�A�J�"���i��e)!	�Z؊U�u�X��j�c�_�r�`֩A�O��X5��F+YNL��A��ƩƗp��ױب���>J�[a|	�J��;�ʴb���F�^�PT�s�)+Xe)qL^wS�`�)%��9�x��bZ��y
Y4�F����$G�$�Rz����[���lu�ie)qN��K�<)�:�,�=�ۼ�R����x��5�'+X�OV�<���F[�g=w[-�A�����v����$+��Ҳ�i����*���	�e͙�Y���:5FM{6�����d)锵Z�*ʹ�v�U+�9�\���������P�e-��Eb)j�y��RwJ�6��Mrd\�pyYJ���t�mMO�'a8�R4��̍ﾒX��R�Vsb|q�id)	�ݛ��GR��$p�����Y��$r�J��^hi�̃�ūu'2+��s�rp�&��U��Pf��+�7�:w��|��EUe�`����$G�C�q�ō&1ŎG�s� Dq�Q�{�p��x���|��S%��<
\�n���9�X�_�y���6]���մ�Ŝt�q�<�RW����A �y��ػ����������p�7�l���?�:������*.ո;i��5�	 Ύ�ș`D*�JZA����V^���%�~������1�#�a'a*�;Qa�y�b��[��'[�"a���H�$��4� ���	j�ô7�xS�@�W�@ ��DF"���X����4g��'4��F�@ ����ܿ� ���e�~�U�T#�x��)vr#�Q��?���2��]i�{8>9^[�� �4�2{�F'&����|���|�.�?��Ȩ"�� 3Tp��93/Dp>ϙ�@�B�\���E��#��YA 7 `�2"���%�c�YM: ��S���"�+ P�9=+D�%�i �3� �G�vs�D ?&"� !�3nEФ��?Q��@D �Z4�]�~D �������6�	q�\.[[7����!��P�=��J��H�*]_��q�s��s��V�=w�� ��9wr��(Z����)'�IH����t�'0��y�luG�9@��UDV�W ��0ݙe)i e��.�� ����<����	�}m֛�������L ,6�  �x����~Tg����&c�U��` ���iڛu����<���?" �-��s[�!}����W�_�J���f����+^*����n�;�SSyp��c��6��e�G���;3Z�A�3�t��i�9b�Pg�����^����t����x��)O��Q�My95�G���;w9�n��$�z[������<w�#�)+��"������" U~}����O��[��|��]q;�lzt�;��Ȱ:��7�������E��*��oh�z���N<_�>���>>��|O�׷_L��/������զ9̳���{���z~����Ŀ?� �.݌��?�N����|��ZgO�o�����9��!�
Ƽ�}S߫˓���:����q�;i��i�]�t� G��Q0�_î!�w��?-��0_�|��nk�S�0l�>=]�e9�G��v��J[=Y9b�3�mE�X�X�-A��fV�2K�jS0"��2!��7��؀�3���3�\�+2�Z`��T	�hI-��N�2���A��M�@�jl����	���5�a�Y�6-o���������x}�}t��Zgs>1)���mQ?����vbZR����m���C��C�{�3o��=}b"/�|���o��?_^�_�+��,���5�U��� 4��]>	@Cl5���w��_$�c��V��sr*5 5��I��9��
�hJV�!�jk�A�=ٞ7���9<T�gť�o�٣����������l��Y�:���}�G�R}Ο����������r!Nϊ�C�;m7�dg����Ez���S%��8��)2Kͪ�6̰�5�/Ӥ�ag�1���,9Pu�]o�Q��{��;�J?<�Yo^_��~��.�>�����]����>߿Y�_�,�U_��o�~��[?n�=��Wg����>���������}y��N�m	n���Kro�䨯rJ���.u�e���-K��䐖��Y�['��N��p������r�Εܪ�x]���j1=^�wʩ4�,���!�&;ج��j�e��EcL���b�_��E�ϕ�u�$�Y��Lj��*���٢Z�y�F��m�p�
�Rw�����,Y�/q��h�M!���,V� �g��Y�J��
.��e�h#�m�d���Y�h�������k�c�q��ǷN��6�z���kD�6�L;�N\���Y�����
�O�ʨ1*]a�SN�=	fH�JN�9%'�S<C:��:`�s��~��jKEU�#i����$�K�TQD���G0H�=�� �d�-Q�H�4�5��L�r?����}��B+��,Q�yO�H�jD�4d�����0*�]�	~�ӎ�.�"����%
��d$"5zxA:�U��H���H%jس{���kW��)�	8J��v�}�rK�F�@�t)FXu����G'.X�8�KH;���[          [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://ctgxo1trpvfkq"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
                RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled           local://RectangleShape2D_yir78 +         local://PackedScene_2s28o \         RectangleShape2D       
     HB  HB         PackedScene          	         names "   
   
   KillerBox    collision_layer    collision_mask    StaticBody2D    CollisionShape2D 	   position    shape 
   Polygon2D    color    polygon    	   variants                   
     �A  �A               �?          �?%                HB      HB  HB      HB      node_count             nodes     !   ��������       ����                                  ����                                 ����         	                conn_count              conns               node_paths              editable_instances              version             RSRC   RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       PackedScene    res://ground_box.tscn [�dx/#�|   PackedScene    res://char_new.tscn 4��"���M   PackedScene    res://checkpoint.tscn �F:�:@x   PackedScene    res://killer_box.tscn �=��aNbw      local://PackedScene_xnbud �         PackedScene          	         names "         Main    Node2D 
   GroundBox 	   position    scale    GroundBox2    GroundBox3    GroundBox4    GroundBox5 	   rotation    Char    Checkpoint2    Checkpoint3 
   KillerBox    	   variants                 
     ��  �B
     �B�7@
     C  �A
   f?  �@
     �C  ��
     �C  ��
    ��D  B   ��?
   �F��I�<A         
         ��         
    �D  �B
     @@  @@
    @�D  �B         
    �� �D
     zD��B      node_count    
         nodes     j   ��������       ����                ���                                  ���                                  ���                                  ���                                  ���                	         	               ���
   
                        ���                                 ���                                 ���                               conn_count              conns               node_paths              editable_instances              version             RSRC      [remap]

path="res://.godot/exported/133200997/export-f7f08bc39a535487989e6c251f5e40c8-char.scn"
               [remap]

path="res://.godot/exported/133200997/export-9bd5710ce042774748b0d0537062e337-char_new.scn"
           [remap]

path="res://.godot/exported/133200997/export-8f2dd19d5636782311f5e9475e3887f8-checkpoint.scn"
         [remap]

path="res://.godot/exported/133200997/export-fd9bf08f4a38c63924b951fcf3548550-ground_box.scn"
         [remap]

path="res://.godot/exported/133200997/export-f948428d5540b70143f2270483c56391-killer_box.scn"
         [remap]

path="res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn"
               list=Array[Dictionary]([])
     <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
             I2��WU>   res://char.tscn[�dx/#�|   res://ground_box.tscn��t�T   res://icon.svg��9$Wi!   res://main.tscn4��"���M   res://char_new.tscn�F:�:@x   res://checkpoint.tscn�=��aNbw   res://killer_box.tscn          ECFG
      application/config/name      
   Pogostuck2     application/run/main_scene         res://main.tscn    application/config/features(   "         4.2    GL Compatibility       application/config/icon         res://icon.svg     layer_names/2d_physics/layer_2         ground     layer_names/2d_physics/layer_3         char   layer_names/2d_physics/layer_4         checkpoints    layer_names/2d_physics/layer_5         killer  #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility    