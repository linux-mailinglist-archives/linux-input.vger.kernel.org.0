Return-Path: <linux-input+bounces-1063-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFF7820E20
	for <lists+linux-input@lfdr.de>; Sun, 31 Dec 2023 21:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E0CE1C2189A
	for <lists+linux-input@lfdr.de>; Sun, 31 Dec 2023 20:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E09BE4A;
	Sun, 31 Dec 2023 20:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANRMX9nM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6ABBA3F
	for <linux-input@vger.kernel.org>; Sun, 31 Dec 2023 20:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-59426ca689cso4252727eaf.0
        for <linux-input@vger.kernel.org>; Sun, 31 Dec 2023 12:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704056210; x=1704661010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFjD0OofEpNNXwvQ9D6zzIIWI1ti5uwannNYZ+Y+q54=;
        b=ANRMX9nM99kKUYgNg6Ks2y+G9CLinJb/BfORNC6+0dWbWe4yf9VK1pgK0cMqoEN4d6
         eSNKAz+VKlc50ZSTbgVmvhp5nm0Z+s67Ql9nBjPnGgYq1K+nMPyLqsBRdGaThjXDQddy
         AgJK17suvuLaX7rLxSPNP0RTlvCoMli1ezxX0iecXaEzGEONjgelxt7VywO2BWj8kO6F
         C+QEZV8vi95DZhD7mAnk9Z8vHOdSP1z1bv/wWP0eSvqPrqq13q+eIlLQDnm+k3kG29N+
         e45CMug1LOLXIZdd+Bfqcf18nC/pJljuCM9A6wbkXezT3wBtjubb6kDNRFqNr/PFziPu
         HR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704056210; x=1704661010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YFjD0OofEpNNXwvQ9D6zzIIWI1ti5uwannNYZ+Y+q54=;
        b=Q2kdJsrYfYkTcFcFbnKd3c3OXcQuDYtEAQYa9sPf4DVyMSFtJ6KNOVlM/zmEjaz05X
         Em22PFpMjLxbxpcx9XNryXlTiZ7xHKniJGYgfDOKzlxFgAjx8KnOhaMkeMQClM3Gf1EX
         rUw4ROu/Lu3ITXVcK22ZhfQ8bpJzf3V0tvn+NVCabJxfPNKL3OZRnwQFV08f8JbSUn/W
         a31ScHrZ842cQth9JIYEvw4kuK9MSxc7yYZ8ak9NplGFkUd0Xn257HE87mEEgorc3OIa
         qOgvcEncbBLgxCvhejtNAjurKManGdK88XQzxFnvM4do7HyqoKQsO6EXzo6Nwbaw+h1p
         qY2A==
X-Gm-Message-State: AOJu0Yxp5/ee2YRubKeMUR8KfETFIOXhEWRn/Hz9JAe/avo+tUXM7sGg
	5GzS+bEF70d28mAJaEhllEqHD5PyVyhiMg==
X-Google-Smtp-Source: AGHT+IGcXC0aRB3Smo/fkIKGE13NrCAAJBBbFmJjT/zmDT+gC8y8kKSWXUJPKOhjbyAXmrnS4B3/Sw==
X-Received: by 2002:a05:6870:d148:b0:204:369e:74b9 with SMTP id f8-20020a056870d14800b00204369e74b9mr11205235oac.7.1704056210444;
        Sun, 31 Dec 2023 12:56:50 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id v1-20020a056870954100b00203d8ce415bsm4843404oal.50.2023.12.31.12.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 12:56:49 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-input@vger.kernel.org
Cc: dmitry.torokhov@gmail.com,
	hdegoede@redhat.com,
	paul@crapouillou.net,
	peter.hutterer@who-t.net,
	svv@google.com,
	biswarupp@google.com,
	contact@artur-rojek.eu,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 2/2] Input: adc-joystick: Handle inverted axes
Date: Sun, 31 Dec 2023 14:56:43 -0600
Message-Id: <20231231205643.129435-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231231205643.129435-1-macroalpha82@gmail.com>
References: <20231231205643.129435-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

When one or more axes are inverted, (where min > max), normalize the
data so that min < max and call a helper function to invert the
values reported to the input stack.

This ensures we can continue defining the device correctly in the
device tree while not breaking downstream assumptions that min is
always less than max.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/input/joystick/adc-joystick.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/input/joystick/adc-joystick.c b/drivers/input/joystick/adc-joystick.c
index c0deff5d4282..4e8d446987b6 100644
--- a/drivers/input/joystick/adc-joystick.c
+++ b/drivers/input/joystick/adc-joystick.c
@@ -18,6 +18,7 @@ struct adc_joystick_axis {
 	s32 range[2];
 	s32 fuzz;
 	s32 flat;
+	bool inverted;
 };
 
 struct adc_joystick {
@@ -38,6 +39,8 @@ static void adc_joystick_poll(struct input_dev *input)
 		ret = iio_read_channel_raw(&joy->chans[i], &val);
 		if (ret < 0)
 			return;
+		if (joy->axes[i].inverted)
+			val = input_invert_abs(input, i, val);
 		input_report_abs(input, joy->axes[i].code, val);
 	}
 	input_sync(input);
@@ -86,6 +89,8 @@ static int adc_joystick_handle(const void *data, void *private)
 			val = sign_extend32(val, msb);
 		else
 			val &= GENMASK(msb, 0);
+		if (joy->axes[i].inverted)
+			val = input_invert_abs(joy->input, i, val);
 		input_report_abs(joy->input, joy->axes[i].code, val);
 	}
 
@@ -168,11 +173,17 @@ static int adc_joystick_set_axes(struct device *dev, struct adc_joystick *joy)
 			goto err_fwnode_put;
 		}
 
+		if (axes[i].range[0] > axes[i].range[1]) {
+			dev_dbg(dev, "abs-axis %d inverted\n", i);
+			axes[i].inverted = 1;
+		}
+
 		fwnode_property_read_u32(child, "abs-fuzz", &axes[i].fuzz);
 		fwnode_property_read_u32(child, "abs-flat", &axes[i].flat);
 
 		input_set_abs_params(joy->input, axes[i].code,
-				     axes[i].range[0], axes[i].range[1],
+				     min_array(axes[i].range, 2),
+				     max_array(axes[i].range, 2),
 				     axes[i].fuzz, axes[i].flat);
 		input_set_capability(joy->input, EV_ABS, axes[i].code);
 	}
-- 
2.34.1


