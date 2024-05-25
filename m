Return-Path: <linux-input+bounces-3839-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7798CF123
	for <lists+linux-input@lfdr.de>; Sat, 25 May 2024 21:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B72631F21DE9
	for <lists+linux-input@lfdr.de>; Sat, 25 May 2024 19:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48412127B4D;
	Sat, 25 May 2024 19:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iWxZb5TR"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8BF1272D9
	for <linux-input@vger.kernel.org>; Sat, 25 May 2024 19:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716665952; cv=none; b=BZkzuRKaYa9cZQd0/ssASGBKHfib03EQAdZG/qsSlwamscUREfNuoELNFGVjHLPoaoxwg+Y91u0bwnO+4KNoJZxERCI0TC2+uhog6Fc3RKUo5sD2Qzy/633Ho4wl/aNtkBbCk3IfLczEiAKkXjJXKfCvvH66/YavO1eQfbb/2xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716665952; c=relaxed/simple;
	bh=k3M5J8Z78RNxM8thi6m3ae4ynsGp4M3yaVw3Ad1clfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eeJQ8vXs4Q0H3l5Fu4Y1Y4HHDafznOrSstP//VgoOOFQocH7ni6V1MMdioSvAH1nXvwzLQl+bssVO+WcBg0yHGVqztXiOHa7JXWKHvjIPUeqtlBIFWxR/LesjbpKPgjaPZl66c0k/jaIAza9DSwnHQuVH8kYsXjo1QJ9wVrlJD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iWxZb5TR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716665949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fE3uT5MUFpNyjTCajkwlLPVqvLVvUxfzKQmudfxeXh8=;
	b=iWxZb5TR27khnqjMi8HAHqkL2+oVhyIjZ/TLiH+VIJohbhRdpyj5HnZ7hyKVPbTKTxwPjf
	8D0JfPo0im9hxSIzlyx4UIigL4X/wYUWzqkJBs2hurpCNNHTwIemE0RDPZVPZFjDYu5NzO
	nUjcPMen1aefcGMPYmMH6kK4rceqGGI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-S5QIFNdsMEyisC_sB_jxag-1; Sat, 25 May 2024 15:39:03 -0400
X-MC-Unique: S5QIFNdsMEyisC_sB_jxag-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 026D181227E;
	Sat, 25 May 2024 19:39:03 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 16B8628E2;
	Sat, 25 May 2024 19:39:01 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: touchscreen_dmi: Drop "silead,max-fingers" property
Date: Sat, 25 May 2024 21:38:54 +0200
Message-ID: <20240525193854.39130-3-hdegoede@redhat.com>
In-Reply-To: <20240525193854.39130-1-hdegoede@redhat.com>
References: <20240525193854.39130-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

The silead touchscreen driver now defaults to 10 fingers, so it is no
longer necessary to have a "silead,max-fingers=10" property for each
silead touchscreen model. Drop this property from all the configs.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 56 --------------------------
 1 file changed, 56 deletions(-)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index b021fb9e579e..06729dec8ef1 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -34,7 +34,6 @@ static const struct property_entry archos_101_cesium_educ_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1280),
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-archos-101-cesium-educ.fw"),
 	{ }
@@ -49,7 +48,6 @@ static const struct property_entry bush_bush_windows_tablet_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1850),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1280),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-bush-bush-windows-tablet.fw"),
 	{ }
@@ -79,7 +77,6 @@ static const struct property_entry chuwi_hi8_air_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1148),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3676-chuwi-hi8-air.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	{ }
 };
 
@@ -95,7 +92,6 @@ static const struct property_entry chuwi_hi8_pro_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1148),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3680-chuwi-hi8-pro.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -123,7 +119,6 @@ static const struct property_entry chuwi_hi10_air_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-fuzz-x", 5),
 	PROPERTY_ENTRY_U32("touchscreen-fuzz-y", 4),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-chuwi-hi10-air.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -139,7 +134,6 @@ static const struct property_entry chuwi_hi10_plus_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1908),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1270),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-chuwi-hi10plus.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	PROPERTY_ENTRY_BOOL("silead,pen-supported"),
 	PROPERTY_ENTRY_U32("silead,pen-resolution-x", 8),
@@ -171,7 +165,6 @@ static const struct property_entry chuwi_hi10_pro_props[] = {
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-chuwi-hi10-pro.fw"),
 	PROPERTY_ENTRY_U32_ARRAY("silead,efi-fw-min-max", chuwi_hi10_pro_efi_min_max),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	PROPERTY_ENTRY_BOOL("silead,pen-supported"),
 	PROPERTY_ENTRY_U32("silead,pen-resolution-x", 8),
@@ -201,7 +194,6 @@ static const struct property_entry chuwi_hibook_props[] = {
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-chuwi-hibook.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -227,7 +219,6 @@ static const struct property_entry chuwi_vi8_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3676-chuwi-vi8.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -255,7 +246,6 @@ static const struct property_entry chuwi_vi10_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1858),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1280),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3680-chuwi-vi10.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -271,7 +261,6 @@ static const struct property_entry chuwi_surbook_mini_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 2040),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1524),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-chuwi-surbook-mini.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
 	{ }
 };
@@ -289,7 +278,6 @@ static const struct property_entry connect_tablet9_props[] = {
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-connect-tablet9.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	{ }
 };
 
@@ -306,7 +294,6 @@ static const struct property_entry csl_panther_tab_hd_props[] = {
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-csl-panther-tab-hd.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	{ }
 };
 
@@ -322,7 +309,6 @@ static const struct property_entry cube_iwork8_air_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 896),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3670-cube-iwork8-air.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	{ }
 };
 
@@ -346,7 +332,6 @@ static const struct property_entry cube_knote_i1101_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1961),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1513),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3692-cube-knote-i1101.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -360,7 +345,6 @@ static const struct property_entry dexp_ursus_7w_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 890),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 630),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1686-dexp-ursus-7w.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -376,7 +360,6 @@ static const struct property_entry dexp_ursus_kx210i_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1720),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1137),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-dexp-ursus-kx210i.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -391,7 +374,6 @@ static const struct property_entry digma_citi_e200_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1500),
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1686-digma_citi_e200.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -450,7 +432,6 @@ static const struct property_entry irbis_tw90_props[] = {
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3680-irbis_tw90.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -466,7 +447,6 @@ static const struct property_entry irbis_tw118_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1960),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1510),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-irbis-tw118.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	{ }
 };
 
@@ -483,7 +463,6 @@ static const struct property_entry itworks_tw891_props[] = {
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3670-itworks-tw891.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	{ }
 };
 
@@ -496,7 +475,6 @@ static const struct property_entry jumper_ezpad_6_pro_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1980),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1500),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3692-jumper-ezpad-6-pro.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -511,7 +489,6 @@ static const struct property_entry jumper_ezpad_6_pro_b_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1500),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3692-jumper-ezpad-6-pro-b.fw"),
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -527,7 +504,6 @@ static const struct property_entry jumper_ezpad_6_m4_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1950),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1525),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3692-jumper-ezpad-6-m4.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -544,7 +520,6 @@ static const struct property_entry jumper_ezpad_7_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1526),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3680-jumper-ezpad-7.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,stuck-controller-bug"),
 	{ }
 };
@@ -561,7 +536,6 @@ static const struct property_entry jumper_ezpad_mini3_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1138),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3676-jumper-ezpad-mini3.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	{ }
 };
 
@@ -578,7 +552,6 @@ static const struct property_entry mpman_converter9_props[] = {
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-mpman-converter9.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	{ }
 };
 
@@ -594,7 +567,6 @@ static const struct property_entry mpman_mpwin895cl_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1150),
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3680-mpman-mpwin895cl.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -611,7 +583,6 @@ static const struct property_entry myria_my8307_props[] = {
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-myria-my8307.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -628,7 +599,6 @@ static const struct property_entry onda_obook_20_plus_props[] = {
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3676-onda-obook-20-plus.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -645,7 +615,6 @@ static const struct property_entry onda_v80_plus_v3_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3676-onda-v80-plus-v3.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -669,7 +638,6 @@ static const struct property_entry onda_v820w_32g_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-onda-v820w-32g.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -687,7 +655,6 @@ static const struct property_entry onda_v891_v5_props[] = {
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name",
 			      "gsl3676-onda-v891-v5.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -703,7 +670,6 @@ static const struct property_entry onda_v891w_v1_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1676),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1130),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3680-onda-v891w-v1.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -720,7 +686,6 @@ static const struct property_entry onda_v891w_v3_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1135),
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3676-onda-v891w-v3.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -759,7 +724,6 @@ static const struct property_entry pipo_w11_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1984),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1532),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-pipo-w11.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -775,7 +739,6 @@ static const struct property_entry positivo_c4128b_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1915),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1269),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-positivo-c4128b.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	{ }
 };
 
@@ -791,7 +754,6 @@ static const struct property_entry pov_mobii_wintab_p800w_v20_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1146),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3680-pov-mobii-wintab-p800w-v20.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -808,7 +770,6 @@ static const struct property_entry pov_mobii_wintab_p800w_v21_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1148),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3692-pov-mobii-wintab-p800w.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -825,7 +786,6 @@ static const struct property_entry pov_mobii_wintab_p1006w_v10_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1520),
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3692-pov-mobii-wintab-p1006w-v10.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -842,7 +802,6 @@ static const struct property_entry predia_basic_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1144),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3680-predia-basic.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -859,7 +818,6 @@ static const struct property_entry rca_cambio_w101_v2_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 874),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-rca-cambio-w101-v2.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	{ }
 };
 
@@ -874,7 +832,6 @@ static const struct property_entry rwc_nanote_p8_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-rwc-nanote-p8.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	{ }
 };
 
@@ -890,7 +847,6 @@ static const struct property_entry schneider_sct101ctm_props[] = {
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-schneider-sct101ctm.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -907,7 +863,6 @@ static const struct property_entry techbite_arc_11_6_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1270),
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-techbite-arc-11-6.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	{ }
 };
 
@@ -923,7 +878,6 @@ static const struct property_entry teclast_tbook11_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1264),
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3692-teclast-tbook11.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -949,7 +903,6 @@ static const struct property_entry teclast_x16_plus_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1264),
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3692-teclast-x16-plus.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -972,7 +925,6 @@ static const struct property_entry teclast_x3_plus_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1980),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1500),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-teclast-x3-plus.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -988,7 +940,6 @@ static const struct property_entry teclast_x98plus2_props[] = {
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1686-teclast_x98plus2.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	{ }
 };
 
@@ -1002,7 +953,6 @@ static const struct property_entry trekstor_primebook_c11_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1530),
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-trekstor-primebook-c11.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -1016,7 +966,6 @@ static const struct property_entry trekstor_primebook_c13_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 2624),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1920),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-trekstor-primebook-c13.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -1030,7 +979,6 @@ static const struct property_entry trekstor_primetab_t13b_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 2500),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1900),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-trekstor-primetab-t13b.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
 	{ }
@@ -1058,7 +1006,6 @@ static const struct property_entry trekstor_surftab_twin_10_1_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1280),
 	PROPERTY_ENTRY_U32("touchscreen-inverted-y", 1),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3670-surftab-twin-10-1-st10432-8.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -1074,7 +1021,6 @@ static const struct property_entry trekstor_surftab_wintron70_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 884),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 632),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1686-surftab-wintron70-st70416-6.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -1091,7 +1037,6 @@ static const struct property_entry viglen_connect_10_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-fuzz-y", 6),
 	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl3680-viglen-connect-10.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
@@ -1105,7 +1050,6 @@ static const struct property_entry vinga_twizzle_j116_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1920),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1280),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-vinga-twizzle_j116.fw"),
-	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
 	{ }
 };
-- 
2.45.1


