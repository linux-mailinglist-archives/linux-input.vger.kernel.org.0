Return-Path: <linux-input+bounces-4013-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B74D98D7460
	for <lists+linux-input@lfdr.de>; Sun,  2 Jun 2024 11:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A59D281C16
	for <lists+linux-input@lfdr.de>; Sun,  2 Jun 2024 09:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074192C684;
	Sun,  2 Jun 2024 09:02:55 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F214249E5
	for <linux-input@vger.kernel.org>; Sun,  2 Jun 2024 09:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717318974; cv=none; b=fvfFQ2YwAbGiRJD7aCg89UQsXqkGhT9+ZQ2snXVHGmYIn4ywSeDd8ef9V7nXW0RETHYD/8ONZqbOtkxqBrDbQQFvCrsZcFc7raDD9X1Qx9S7uukTACjw7Xl6RSJsW41+53CEGeXAxb0p+7xbxI/FKr1sx3nwuONGN22mMkzRq3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717318974; c=relaxed/simple;
	bh=9h94DqXvQDdb48Sdw6WpvBt3kLrGfO30x8RvJcq38WI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LAZD0vcAHL/jWi39tbVFmwMDdFEMd2D9mHQU2jDtsg7/0yjNmqIXSYiQOa0h2dmvpcZDNWERLBHwAZZKFxwa22WVSbaEP6BemtNzw7akXnqhzheVegH86CsZ1VNyviEv7g2obgAlAnxPOnsWAQE/h4rBVq2AVeS84t3FgT3HVjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id e39b5d9a-20be-11ef-8e3d-005056bdf889;
	Sun, 02 Jun 2024 12:02:50 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Jorge Lopez <jorge.lopez2@hp.com>,
	Li Zetao <lizetao1@huawei.com>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-input@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Mark Pearson <markpearson@lenovo.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [PATCH v1 2/7] platform/x86: hp: hp-bioscfg: Use 2-argument strscpy()
Date: Sun,  2 Jun 2024 11:57:55 +0300
Message-ID: <20240602090244.1666360-3-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240602090244.1666360-1-andy.shevchenko@gmail.com>
References: <20240602090244.1666360-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use 2-argument strscpy(), which is not only shorter but also provides
an additional check that destination buffer is an array.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 .../x86/hp/hp-bioscfg/enum-attributes.c       | 18 +++++-------------
 .../x86/hp/hp-bioscfg/int-attributes.c        |  7 ++-----
 .../x86/hp/hp-bioscfg/order-list-attributes.c | 18 +++++-------------
 .../x86/hp/hp-bioscfg/passwdobj-attributes.c  | 19 +++++--------------
 .../x86/hp/hp-bioscfg/spmobj-attributes.c     |  3 +--
 .../x86/hp/hp-bioscfg/string-attributes.c     | 12 ++++--------
 6 files changed, 22 insertions(+), 55 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
index a2402d31c146..c50ad5880503 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
@@ -52,9 +52,7 @@ static void update_enumeration_value(int instance_id, char *attr_value)
 {
 	struct enumeration_data *enum_data = &bioscfg_drv.enumeration_data[instance_id];
 
-	strscpy(enum_data->current_value,
-		attr_value,
-		sizeof(enum_data->current_value));
+	strscpy(enum_data->current_value, attr_value);
 }
 
 ATTRIBUTE_S_COMMON_PROPERTY_SHOW(display_name, enumeration);
@@ -174,8 +172,7 @@ static int hp_populate_enumeration_elements_from_package(union acpi_object *enum
 		case VALUE:
 			break;
 		case PATH:
-			strscpy(enum_data->common.path, str_value,
-				sizeof(enum_data->common.path));
+			strscpy(enum_data->common.path, str_value);
 			break;
 		case IS_READONLY:
 			enum_data->common.is_readonly = int_value;
@@ -222,9 +219,7 @@ static int hp_populate_enumeration_elements_from_package(union acpi_object *enum
 				if (ret)
 					return -EINVAL;
 
-				strscpy(enum_data->common.prerequisites[reqs],
-					str_value,
-					sizeof(enum_data->common.prerequisites[reqs]));
+				strscpy(enum_data->common.prerequisites[reqs], str_value);
 
 				kfree(str_value);
 				str_value = NULL;
@@ -236,8 +231,7 @@ static int hp_populate_enumeration_elements_from_package(union acpi_object *enum
 			break;
 
 		case ENUM_CURRENT_VALUE:
-			strscpy(enum_data->current_value,
-				str_value, sizeof(enum_data->current_value));
+			strscpy(enum_data->current_value, str_value);
 			break;
 		case ENUM_SIZE:
 			if (int_value > MAX_VALUES_SIZE) {
@@ -278,9 +272,7 @@ static int hp_populate_enumeration_elements_from_package(union acpi_object *enum
 				 * is greater than MAX_VALUES_SIZE
 				 */
 				if (size < MAX_VALUES_SIZE)
-					strscpy(enum_data->possible_values[pos_values],
-						str_value,
-						sizeof(enum_data->possible_values[pos_values]));
+					strscpy(enum_data->possible_values[pos_values], str_value);
 
 				kfree(str_value);
 				str_value = NULL;
diff --git a/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
index 86b7ac63fec2..6c7f4d5fa9cb 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
@@ -192,8 +192,7 @@ static int hp_populate_integer_elements_from_package(union acpi_object *integer_
 			integer_data->current_value = int_value;
 			break;
 		case PATH:
-			strscpy(integer_data->common.path, str_value,
-				sizeof(integer_data->common.path));
+			strscpy(integer_data->common.path, str_value);
 			break;
 		case IS_READONLY:
 			integer_data->common.is_readonly = int_value;
@@ -240,9 +239,7 @@ static int hp_populate_integer_elements_from_package(union acpi_object *integer_
 				if (ret)
 					continue;
 
-				strscpy(integer_data->common.prerequisites[reqs],
-					str_value,
-					sizeof(integer_data->common.prerequisites[reqs]));
+				strscpy(integer_data->common.prerequisites[reqs], str_value);
 				kfree(str_value);
 				str_value = NULL;
 			}
diff --git a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
index 1ff09dfb7d7e..c6e57bb9d8b7 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
@@ -57,9 +57,7 @@ static void update_ordered_list_value(int instance, char *attr_value)
 {
 	struct ordered_list_data *ordered_list_data = &bioscfg_drv.ordered_list_data[instance];
 
-	strscpy(ordered_list_data->current_value,
-		attr_value,
-		sizeof(ordered_list_data->current_value));
+	strscpy(ordered_list_data->current_value, attr_value);
 }
 
 ATTRIBUTE_S_COMMON_PROPERTY_SHOW(display_name, ordered_list);
@@ -179,13 +177,11 @@ static int hp_populate_ordered_list_elements_from_package(union acpi_object *ord
 		/* Assign appropriate element value to corresponding field*/
 		switch (eloc) {
 		case VALUE:
-			strscpy(ordered_list_data->current_value,
-				str_value, sizeof(ordered_list_data->current_value));
+			strscpy(ordered_list_data->current_value, str_value);
 			replace_char_str(ordered_list_data->current_value, COMMA_SEP, SEMICOLON_SEP);
 			break;
 		case PATH:
-			strscpy(ordered_list_data->common.path, str_value,
-				sizeof(ordered_list_data->common.path));
+			strscpy(ordered_list_data->common.path, str_value);
 			break;
 		case IS_READONLY:
 			ordered_list_data->common.is_readonly = int_value;
@@ -227,9 +223,7 @@ static int hp_populate_ordered_list_elements_from_package(union acpi_object *ord
 				if (ret)
 					continue;
 
-				strscpy(ordered_list_data->common.prerequisites[reqs],
-					str_value,
-					sizeof(ordered_list_data->common.prerequisites[reqs]));
+				strscpy(ordered_list_data->common.prerequisites[reqs], str_value);
 
 				kfree(str_value);
 				str_value = NULL;
@@ -271,9 +265,7 @@ static int hp_populate_ordered_list_elements_from_package(union acpi_object *ord
 			part = strsep(&part_tmp, COMMA_SEP);
 
 			for (olist_elem = 0; olist_elem < MAX_ELEMENTS_SIZE && part; olist_elem++) {
-				strscpy(ordered_list_data->elements[olist_elem],
-					part,
-					sizeof(ordered_list_data->elements[olist_elem]));
+				strscpy(ordered_list_data->elements[olist_elem], part);
 				part = strsep(&part_tmp, COMMA_SEP);
 			}
 			ordered_list_data->elements_size = olist_elem;
diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
index f7efe217a4bb..35936c05e45b 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
@@ -101,13 +101,9 @@ static int store_password_instance(struct kobject *kobj, const char *buf,
 
 	if (!ret) {
 		if (is_current)
-			strscpy(bioscfg_drv.password_data[id].current_password,
-				buf_cp,
-				sizeof(bioscfg_drv.password_data[id].current_password));
+			strscpy(bioscfg_drv.password_data[id].current_password, buf_cp);
 		else
-			strscpy(bioscfg_drv.password_data[id].new_password,
-				buf_cp,
-				sizeof(bioscfg_drv.password_data[id].new_password));
+			strscpy(bioscfg_drv.password_data[id].new_password, buf_cp);
 	}
 
 	kfree(buf_cp);
@@ -272,8 +268,7 @@ static int hp_populate_password_elements_from_package(union acpi_object *passwor
 		case VALUE:
 			break;
 		case PATH:
-			strscpy(password_data->common.path, str_value,
-				sizeof(password_data->common.path));
+			strscpy(password_data->common.path, str_value);
 			break;
 		case IS_READONLY:
 			password_data->common.is_readonly = int_value;
@@ -315,9 +310,7 @@ static int hp_populate_password_elements_from_package(union acpi_object *passwor
 				if (ret)
 					break;
 
-				strscpy(password_data->common.prerequisites[reqs],
-					str_value,
-					sizeof(password_data->common.prerequisites[reqs]));
+				strscpy(password_data->common.prerequisites[reqs], str_value);
 
 				kfree(str_value);
 				str_value = NULL;
@@ -359,9 +352,7 @@ static int hp_populate_password_elements_from_package(union acpi_object *passwor
 				if (ret)
 					break;
 
-				strscpy(password_data->encodings[pos_values],
-					str_value,
-					sizeof(password_data->encodings[pos_values]));
+				strscpy(password_data->encodings[pos_values], str_value);
 				kfree(str_value);
 				str_value = NULL;
 
diff --git a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
index 86f90238750c..2b00a14792e9 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
@@ -365,8 +365,7 @@ int hp_populate_secure_platform_data(struct kobject *attr_name_kobj)
 	/* Populate data for Secure Platform Management */
 	bioscfg_drv.spm_data.attr_name_kobj = attr_name_kobj;
 
-	strscpy(bioscfg_drv.spm_data.attribute_name, SPM_STR,
-		sizeof(bioscfg_drv.spm_data.attribute_name));
+	strscpy(bioscfg_drv.spm_data.attribute_name, SPM_STR);
 
 	bioscfg_drv.spm_data.is_enabled = 0;
 	bioscfg_drv.spm_data.mechanism = 0;
diff --git a/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
index f0c20070094d..27758b779b2d 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
@@ -50,7 +50,7 @@ static void update_string_value(int instance_id, char *attr_value)
 	struct string_data *string_data = &bioscfg_drv.string_data[instance_id];
 
 	/* Write settings to BIOS */
-	strscpy(string_data->current_value, attr_value, sizeof(string_data->current_value));
+	strscpy(string_data->current_value, attr_value);
 }
 
 /*
@@ -178,12 +178,10 @@ static int hp_populate_string_elements_from_package(union acpi_object *string_ob
 		/* Assign appropriate element value to corresponding field*/
 		switch (eloc) {
 		case VALUE:
-			strscpy(string_data->current_value,
-				str_value, sizeof(string_data->current_value));
+			strscpy(string_data->current_value, str_value);
 			break;
 		case PATH:
-			strscpy(string_data->common.path, str_value,
-				sizeof(string_data->common.path));
+			strscpy(string_data->common.path, str_value);
 			break;
 		case IS_READONLY:
 			string_data->common.is_readonly = int_value;
@@ -231,9 +229,7 @@ static int hp_populate_string_elements_from_package(union acpi_object *string_ob
 				if (ret)
 					continue;
 
-				strscpy(string_data->common.prerequisites[reqs],
-					str_value,
-					sizeof(string_data->common.prerequisites[reqs]));
+				strscpy(string_data->common.prerequisites[reqs], str_value);
 				kfree(str_value);
 				str_value = NULL;
 			}
-- 
2.45.1


