Return-Path: <linux-input+bounces-2653-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8518A890A13
	for <lists+linux-input@lfdr.de>; Thu, 28 Mar 2024 20:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 207621F24897
	for <lists+linux-input@lfdr.de>; Thu, 28 Mar 2024 19:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B785913A878;
	Thu, 28 Mar 2024 19:51:17 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8827E13A41D;
	Thu, 28 Mar 2024 19:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711655477; cv=none; b=amJenpVr/hJvdqwLq8HTlg2wxTGDYU+DtHoaSIhCuCrEP5lLdwSWDXU2BDBhECnpyXKUumEun9MLOfbXRe9cnhSTYrffqQTyYjHALY8shm0ckdMcXuXuA/RwHScvjw9FZ7FwQ/gGouK5smGLi8/TBntAdGAIIrvjfOvLWOF25I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711655477; c=relaxed/simple;
	bh=0nW38Bhg6oefE8bRlPKT27U3IF63dXH13lRRqPo2U40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eNBMWp2SJg5UH6oBnhNpfWDEW/77eac4WjNhG8NXVcQnjzNQS/FCP8Rt8K7FK0opTCxpYCtzzbiTeVmI5OJnh5QbIJWgxa9l8VHrW8vgnRHqDi9TQ3+2slb3BThBkMaZvN/A8wLY2P3gE323dpC3AzMItPN03eHKoo8nBbNgr/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0868FC43394;
	Thu, 28 Mar 2024 19:51:08 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 28 Mar 2024 20:49:20 +0100
Subject: [PATCH v2 10/19] platform/x86/intel/smartconnect: drop owner
 assignment
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240328-b4-module-owner-acpi-v2-10-1e5552c2c69f@linaro.org>
References: <20240328-b4-module-owner-acpi-v2-0-1e5552c2c69f@linaro.org>
In-Reply-To: <20240328-b4-module-owner-acpi-v2-0-1e5552c2c69f@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Matan Ziv-Av <matan@svgalib.org>, Mattia Dongili <malattia@linux.it>, 
 Azael Avalos <coproscefalo@gmail.com>, Ajay Kaher <akaher@vmware.com>, 
 Alexey Makhalov <amakhalov@vmware.com>, 
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, 
 Richard Cochran <richardcochran@gmail.com>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 acpica-devel@lists.linux.dev, linux-input@vger.kernel.org, 
 netdev@vger.kernel.org, chrome-platform@lists.linux.dev, 
 platform-driver-x86@vger.kernel.org, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=888;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=0nW38Bhg6oefE8bRlPKT27U3IF63dXH13lRRqPo2U40=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBcnHI+fLj6TQwOHnlEmbZ6FxpzRq52RY763MR
 nzIN79UrB2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgXJxwAKCRDBN2bmhouD
 10wBD/9XkMl8OBVcxJEVwL68gmpeMVt8oPSvBTufPFhkSxS5n7po79xMsSf2+B8DGDkwiA0YzyA
 ZDxR1ELTeFvOz2w5Bm5wZ/txLIacADcaWlZ2kUmg+oKVeFAw39EMepZ4kzcO9EPwgy19425vrbh
 uxxZ+Xxxp9HXyVGXAFV8U6x7GLA4Zn04pBvlYGfrQvngFn/+keC+5BUQnSYehdDUopoCpMmn+Vv
 SPxV3Exy+4OgLuKrj7QBfK9J2kLRZCfVk6UbFHV+vEjfdWs+eA4vblEsoUa/qtabuG+YmHm1Cnf
 xNVBFqcjulHS1DtAHPwgOBfXIYUALgnawXjDunV3DosOrFobXpfa/gpqYwDmD49kkDDjL4jnKBT
 lRyoxokPASa1UYn4M6D7oF4XXQhjIuGa846rRxQ5SQqyGwmY+r7vXfZOGEwoR64ooCptSHMxNsa
 r9Box+RQkglDpnZV+VY3OtmAVAhWXeFBwq7kMTnmZ03234fbVjhs6xY8PK1TDyPXq30uKbD0QUn
 uJe29LvhydW0cQ87rx4NqVWboMjfYEQDXH3dxuvy/7uPiRxa1BRTj6lp/TU3vNaL6qxdhSq8LIq
 VFmXOaAjCOoo3K4ZXY4JgyqUaSYIfyG4Oqu175/iJHGVJqrAsaOHaUH3C78eYZsSBAF56fdldqw
 3WLIXrjKn3rVUTA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

ACPI bus core already sets the .owner, so driver does not need to.

Acked-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/platform/x86/intel/smartconnect.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/intel/smartconnect.c b/drivers/platform/x86/intel/smartconnect.c
index 64c2dc93472f..cd25d0585324 100644
--- a/drivers/platform/x86/intel/smartconnect.c
+++ b/drivers/platform/x86/intel/smartconnect.c
@@ -32,7 +32,6 @@ static const struct acpi_device_id smartconnect_ids[] = {
 MODULE_DEVICE_TABLE(acpi, smartconnect_ids);
 
 static struct acpi_driver smartconnect_driver = {
-	.owner = THIS_MODULE,
 	.name = "intel_smart_connect",
 	.class = "intel_smart_connect",
 	.ids = smartconnect_ids,

-- 
2.34.1


