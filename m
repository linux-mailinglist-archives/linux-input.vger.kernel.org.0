Return-Path: <linux-input+bounces-15790-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 040F7C181C2
	for <lists+linux-input@lfdr.de>; Wed, 29 Oct 2025 04:00:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC1883BAA27
	for <lists+linux-input@lfdr.de>; Wed, 29 Oct 2025 03:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55AA82ECD37;
	Wed, 29 Oct 2025 03:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtCq750y"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A958D2EC087
	for <linux-input@vger.kernel.org>; Wed, 29 Oct 2025 03:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761706802; cv=none; b=ssqj/kkmWoetd1N3RCl9VWIebGB5/XJ9SKNKlPx1VLBT/N10kSOnYrYlyx3iZ0Py7kxg24db8h6GYoprGY+91vuDGRD8XNK5XEyWM5Nxgd0opsXswWY9OBxUKEtdsd4g6RHFtz5SR6QBSjAHivZ+9FWpb/I6EkH1tXgix6m+5No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761706802; c=relaxed/simple;
	bh=uvWxTYSvYRprQ1ZW3Euflh2mgClxsjMln7S5s7l2A4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tvFLNIsTo3oRnfRHUj7VFiZ48WuYZlcWZNPtz2T1zvr3Fso+k6GJUeSfYp+7cCpMKrpHHi6OP5/iABlEZJasxFVQO/JLMVA2lDz/W0DISjnWLED4DSr2qQU3adY7ql5Y+op05I4GMRcI8yxjogtpP/D4e5nZTZfPQXt8JZwuEvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtCq750y; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4eb9fa69fb8so55423861cf.1
        for <linux-input@vger.kernel.org>; Tue, 28 Oct 2025 20:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761706799; x=1762311599; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ikVE0ssZ8PILuEq4k6Un4Yxlye8b1lZqi+jy3bbKHWs=;
        b=KtCq750yzMPqbDB0T+rDe5/DIlCbEsm60oNYzlPaDsnuNmnQPje3PncG0HV+7wJqoy
         GmOJBIEW2st+e0owkZgEsDpF88zX0Zb+MkqlLFwdoKDdL1RiIkiiaI8ncDw6k/8IC5uA
         TMUcvbpaqCxubrCEvsO4hdKvbnGCc0ceaqAXMq4Rd06jPi8+ugsw8oOgTyiQUYZUt6/p
         bCb0m1cCriaUFskYpq+KE6QKvY/kfiZ9uNsdoX47+VikXAzBHBaDQMAPyd/GEYL0eGx+
         ixef1QrjUe8ohSBywYOAgrriyDd5yWmuLZRRTr9fGLb9fqX/1px/vNErbd0xZylsR+Ey
         V+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761706799; x=1762311599;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ikVE0ssZ8PILuEq4k6Un4Yxlye8b1lZqi+jy3bbKHWs=;
        b=ZoGJDthCMakdvkY5WEynWnCU52RKQfqFMu8WpL/gILzhoTzuebrWCxfMCQICZN+oOo
         1WbJtAkUHQ6BcSzMxN/hqp1/GLJ7IRTWteu4OrGNMnXdgcML2ZdYGiBkF1R3t0TWjKPx
         RXjAKujGPwdETB3pN/+6is2+hze/PfBaCvNCAIcmWTJc8jLaqWHNtLow8pL2CeNn68gL
         nJUXYy9Qwp9brgqrr10oT3Zan3Ak5b2LD6GJ4gPhnipGCAxkUDMaoIvqCbHpJMcddiEZ
         2hel9ShZDQ/byz5PcKvLwb21wNqfG/GAe/VHf+Eiz9J6kMC61SFxGNO8A0E8uHeP7Bik
         5v2A==
X-Forwarded-Encrypted: i=1; AJvYcCXpONvbH+aDYYPPV7TYh4GAHoQJ2tff9H0eryRId6W2HL8EIzzzE5XfoShLDxSjdMBy1tirbK+KzOywmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyge6MBEH68r6eDnKw1F65MhMNki3oMzj++bdI+MKfUiuseQfd
	e5TODDntJf2gIk2ulDcbKMqevlELonszrCvjDnODZySC1zMI3jMw9wKy
X-Gm-Gg: ASbGnct8e29HeXvy0+siwOAAvpN3f/7y0UIG89HDu0Z8B+nOOH2aL1fJEe7yIPkLrEe
	vfciVETxozDyovqe6Euj54Nd2B7DHAVK7Ko9BBUanbxWQtsVi+ILuQQ6Y56BQGw3sAZRwhPrlLE
	mP/qSVcXNM8Ke3I0V3p2IEd9yW/FqI/4bKBMJyCcj5DPJIj6Kg4PuAT2WdP8EgUFRv7MB4CUL28
	tJsl4BI/oHcrQr74LYF2LygX1yLaTaYfWWwQRJpCVFWr2Z1HccPRlGiQZ6n6iI15NqpRcvSOy2r
	RoSzlH3osW6N+cdTKXxyHD9k09g7zafXHROPFnzBUpD89NojXSXRjeT/lgo79JQypE+7wZg71sA
	mIEKdfhVjjzFFpTbT0ZwPLEQK75/WirTslgPT3e8LheVsW4MjeliO5c3lQi/enkvNCB30ppF7VM
	vfsXUgJIk=
X-Google-Smtp-Source: AGHT+IEvOug73vtl4ROvl4ozZsUcProXlbhk8qKycNCnxdG+O+1krran8kKir/F0sNEdEd48ksbtCQ==
X-Received: by 2002:a05:622a:4089:b0:4d3:3ecd:efd0 with SMTP id d75a77b69052e-4ed15b32dafmr19732431cf.6.1761706799473;
        Tue, 28 Oct 2025 19:59:59 -0700 (PDT)
Received: from [192.168.90.162] ([142.182.130.176])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc49783eesm91505776d6.44.2025.10.28.19.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 19:59:58 -0700 (PDT)
From: Samuel Kayode <samkay014@gmail.com>
Date: Tue, 28 Oct 2025 22:59:35 -0400
Subject: [PATCH] input: pf1550: Replace deprecated PM_OPS define
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-pf1550-v1-1-c50fae56b9b1@gmail.com>
X-B4-Tracking: v=1; b=H4sIABaDAWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyML3YI0Q1NTA11zw+TURGPTRINkSwMloOKCotS0zAqwQdGxtbUAZM+
 jM1gAAAA=
X-Change-ID: 20251028-pf1550-71cea35a0c90
To: Jerome Oufella <jerome.oufella@savoirfairelinux.com>, 
 naresh.kamboju@linaro.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
 lee@kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Sean Nyekjaer <sean@geanix.com>, 
 Heiko Carstens <hca@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: linux-s390@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Samuel Kayode <samkay014@gmail.com>, 
 imx@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761706797; l=1053;
 i=samkay014@gmail.com; s=20251028; h=from:subject:message-id;
 bh=uvWxTYSvYRprQ1ZW3Euflh2mgClxsjMln7S5s7l2A4k=;
 b=4fOl76a+CJsXMrMz+3jonDtJ6NY+vU6ExNNoQfFuEd/1lba8UY1jfJ+UsD9eN1tHk4G1uPX5R
 14VlvMCGU0DDnq7Zctg0xOZZ6d15Bc2fsqI4Bw14sECTQ5Ysid+PEw+
X-Developer-Key: i=samkay014@gmail.com; a=ed25519;
 pk=favoK08ilD1j62PrGf+RHihBzbqJGWMC6f2nszR5UIc=

Replace SIMPLE_DEV_PM_OPS with DEFINE_SIMPLE_DEV_PM_OPS as the former is
deprecated.

Signed-off-by: Samuel Kayode <samkay014@gmail.com>
---
 drivers/input/misc/pf1550-onkey.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/pf1550-onkey.c b/drivers/input/misc/pf1550-onkey.c
index 9be6377151cb3be824ab34ff37f983196b909324..a636ceedfc04f0946e002a0b1be4586138429f12 100644
--- a/drivers/input/misc/pf1550-onkey.c
+++ b/drivers/input/misc/pf1550-onkey.c
@@ -173,8 +173,8 @@ static int pf1550_onkey_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(pf1550_onkey_pm_ops, pf1550_onkey_suspend,
-			 pf1550_onkey_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(pf1550_onkey_pm_ops, pf1550_onkey_suspend,
+				pf1550_onkey_resume);
 
 static const struct platform_device_id pf1550_onkey_id[] = {
 	{ "pf1550-onkey", },

---
base-commit: a7d6255a0bf302c028ac680564633a6aac5f611d
change-id: 20251028-pf1550-71cea35a0c90

Best regards,
-- 
Samuel Kayode <samkay014@gmail.com>


