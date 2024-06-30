Return-Path: <linux-input+bounces-4732-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A712591D32D
	for <lists+linux-input@lfdr.de>; Sun, 30 Jun 2024 20:37:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A9DD1F210A5
	for <lists+linux-input@lfdr.de>; Sun, 30 Jun 2024 18:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932CA155A24;
	Sun, 30 Jun 2024 18:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="oMd6pq90"
X-Original-To: linux-input@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A014B15573C
	for <linux-input@vger.kernel.org>; Sun, 30 Jun 2024 18:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719772609; cv=none; b=KH9JykoEdqNglPbkUbDXF6X4O7Mnbv6Z9spsUlnK5DC0ck/nBH54YwyH7a+bRW+pQsfQYCrT3vSenJM8905e+jRXkXVfb/UmyaulyJcQe5ifXNQufOUdycSHyUNrlwSYLylEjB+90esd736DSCZDbjpJd2Si7+T5utLMBH1hK9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719772609; c=relaxed/simple;
	bh=dxKUN9O3IfKfVKdznJW7pHdoyiaNKC3n5pN/k8clVHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M1mscvX8tDAPEkMgSuIy8Yg6inG5JzGvt1VN/7M1yV7zoto24A/EoMF2ZORx/m7ArnVhstdst7yl8bdeXfy3WRBv3apAqd/fgFFXQ7yv/+hHnk3LnvuBRXSLqcYuQP0045FJE0eLH2s0gRGOi3FlGSfZl+Y1oi2oOoL7MISgG0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=oMd6pq90; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Envelope-To: robh@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1719772605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H7U98KFw2NBX8USOS8/v/gKpgMdmoWOHtCL2sTlkgOQ=;
	b=oMd6pq90R6z9R8S8wRou/U0vlye457KJuG6u8Okxu3tzpZPqHbx61UW906oOJSy3Af+k1F
	9VDUMTPfir8LDjJH081jifohQVivb8WQ9NXgOdxwdmOooBhEAx/Lu8+8pnnvBn09fXkOZ1
	vaKWM2KQy1di+XC4qujCHA697fi8AegHngIZ43zcc4B7gdSG+cmkDmQvRQ8D5kqs34HuqW
	r7OsmYy6aq24AwkvdI2fg8NLr5ed4SAENntzQEkvcU1u1poVXclIu6p6z9EHOSChy9zHG0
	qfI28w0fzp95hs8Y5KJorSw1NezH+vYiC2scffD7dVX8Ui5pox2hYRexYA+uPg==
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: neil.armstrong@linaro.org
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: ~postmarketos/upstreaming@lists.sr.ht
X-Envelope-To: dmitry.torokhov@gmail.com
X-Envelope-To: linux-input@vger.kernel.org
X-Envelope-To: mripard@kernel.org
X-Envelope-To: caleb@postmarketos.org
X-Envelope-To: linux-arm-msm@vger.kernel.org
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: rydberg@bitmath.org
X-Envelope-To: konrad.dybcio@linaro.org
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: dmitry.baryshkov@linaro.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: airlied@gmail.com
X-Envelope-To: quic_jesszhan@quicinc.com
X-Envelope-To: andersson@kernel.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Caleb Connolly <caleb@postmarketos.org>
Date: Sun, 30 Jun 2024 20:36:27 +0200
Subject: [PATCH v2 4/8] drm: mipi: add mipi_dsi_generic_write_multi_type()
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240630-oneplus8-v2-4-c4a1f8da74f1@postmarketos.org>
References: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
In-Reply-To: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
To: Caleb Connolly <caleb@postmarketos.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht
X-Developer-Signature: v=1; a=openpgp-sha256; l=3936;
 i=caleb@postmarketos.org; h=from:subject:message-id;
 bh=dxKUN9O3IfKfVKdznJW7pHdoyiaNKC3n5pN/k8clVHk=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBmgaWzNRPFIJh0bhLcxkkzB3Hv+G99oFLCmk2QF
 ftsdylqLDaJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZoGlswAKCRAFgzErGV9k
 tvJLD/41mBLa1W4xZy39T0eQ+94M6vb2BH9D9K78hE3xcpPHY6Y+IQi7LldueaOLFp+pIR59kO2
 SgVhGEYWHGUTsut31X0mcGUAhrAFDxB3/FaJk17BJXXS4IGbLb98jhT0KZJpdl/YaLmX7GyEWpS
 0H4yPzZxRokDuEUHlPMj6S+wJtViAkAtYzf7pTGXIvFFcl3Bh/OkHbwBjvuWc25Sh2ZJ5qB0KVh
 xB2jV1rycXZOZZW/fDpRf12CMkInjqXPrmwuvYEDUQnhEMkScJX100T4T7UfTQ9sPz/QUL/dUnY
 fA0SCfw3BkcwLIXIBpDLK59dlsq1M39ORX1R1sCci1sw3W0DXLtYmctzGUxLagMjrhjUDB3PREI
 +duFie3R4uf5bclPaoJM+1XV5FP9epdBMPHqL0/u/UR1bfmZPjgLsX0PV+XQeRt+Fsbe46ITidg
 wM8u4uCSf/lX5Bc7X7uxsQ1eG/ZEptRC5csSHcNTeDjLyamBYnxDscZ75DwPDcRUxO/vv6iCqhx
 CpwkKUAOTdf7UvdVvErSVAllDHYXSyFbefol/K4hbjirMmb93b96tt2lEAunf9hHYGYWsxp6Oto
 +P1nkdX92p9Il+KvaOs+lUHfECfTVgD9uj1uWskwcF1YHkeIr2+LNYRGDCHr7i70Jg1JIpNftiC
 QFNukbotVqG7eGw==
X-Developer-Key: i=caleb@postmarketos.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Migadu-Flow: FLOW_OUT

Some panels like the Samsung AMB655X use long write commands for all
non-standard messages and do not work when trying to use the appropriate
command type.

Support these panels by introducing a new helper to send commands of a
specific type, overriding the normal rules.

Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 40 ++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_mipi_dsi.h     | 16 ++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index a471c46f5ca6..f2c7f3f23a6e 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -819,8 +819,48 @@ void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 	}
 }
 EXPORT_SYMBOL(mipi_dsi_generic_write_multi);
 
+/**
+ * mipi_dsi_generic_write_raw_multi() - transmit data using a generic write packet of
+ * a specific type
+ * @ctx: Context for multiple DSI transactions
+ * @type: data type of the packet
+ * @payload: buffer containing the payload
+ * @size: size of payload buffer
+ *
+ * This function will automatically choose the right data type depending on
+ * the payload length.
+ *
+ * Return: The number of bytes transmitted on success or a negative error code
+ * on failure.
+ */
+ssize_t mipi_dsi_generic_write_raw_multi(struct mipi_dsi_multi_context *ctx,
+					  u8 type, const void *payload, size_t size)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_msg msg = {
+		.channel = dsi->channel,
+		.tx_buf = payload,
+		.tx_len = size,
+		.type = type,
+	};
+	ssize_t ret;
+
+	if (ctx->accum_err)
+		return 0;
+
+	ret = mipi_dsi_device_transfer(dsi, &msg);
+	if (ret < 0) {
+		ctx->accum_err = ret;
+		dev_err(&dsi->dev, "sending generic data %*ph failed: %zd\n",
+			(int)size, payload, ret);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL(mipi_dsi_generic_write_raw_multi);
+
 /**
  * mipi_dsi_generic_read() - receive data using a generic read packet
  * @dsi: DSI peripheral device
  * @params: buffer containing the request parameters
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 71d121aeef24..fb23f4e3b94e 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -287,8 +287,10 @@ ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
 				  const void *payload, size_t size);
 void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 				  const void *payload, size_t size);
+ssize_t mipi_dsi_generic_write_raw_multi(struct mipi_dsi_multi_context *ctx, u8 type,
+				    const void *payload, size_t size);
 ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
 			      size_t num_params, void *data, size_t size);
 
 #define mipi_dsi_msleep(ctx, delay)	\
@@ -432,8 +434,22 @@ void mipi_dsi_dcs_set_tear_on_multi(struct mipi_dsi_multi_context *ctx,
 		static const u8 d[] = { cmd, seq };                     \
 		mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
 	} while (0)
 
+/**
+ * mipi_dsi_dcs_write_long_multi - transmit a DCS long command with payload
+ * @ctx: Context for multiple DSI transactions
+ * @cmd: Commands
+ * @seq: buffer containing data to be transmitted
+ */
+#define mipi_dsi_dcs_write_long_multi(ctx, cmd, seq...)                    \
+	do {                                                               \
+		static const u8 d[] = { cmd, seq };                        \
+		mipi_dsi_generic_write_raw_multi(ctx,                      \
+						  MIPI_DSI_DCS_LONG_WRITE, \
+						  d, ARRAY_SIZE(d));       \
+	} while (0)
+
 /**
  * struct mipi_dsi_driver - DSI driver
  * @driver: device driver model driver
  * @probe: callback for device binding

-- 
2.45.0


