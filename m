Return-Path: <linux-input+bounces-14460-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBE5B426B2
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 18:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DFA07BA6D8
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 16:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 144BB2C0F72;
	Wed,  3 Sep 2025 16:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kpaA3xwk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAFD285C8D;
	Wed,  3 Sep 2025 16:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756916418; cv=none; b=uNoNacl4NegaU3qB4vUqzIxuCgl5gfAAjXh/ok4dwvwto3o0jRPH2bxRMyS304IG5ByJ5ITMo8jIjtscE51T7tG9IXj81jHV/9cInww9Sg5daqCD5R1xkn6Y7WCoahOUkb4sY4uNPsO602Ei5iJl49gjsvwy3VoHHEYC3yN0HxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756916418; c=relaxed/simple;
	bh=DKy+UjJDXcUUgLZXi93bpYa9hIOrvcQEMv7HHUMgmX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UYYv0Vj+K2KFH1dSj5vvhDys3XVK26bDftWDpxGeOmPQsxP2egan57047l9S32j7uYI9wRUCqOmnY/BwUb9JAS9VQ5fUlWffCTDelASDBxIZ/NYb6Po1S8012VTbgz7EsLHV0G89lVeCbI31nvXjy3+wHrb5siaYX7HLLvkYyeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kpaA3xwk; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-560888dc903so1779899e87.2;
        Wed, 03 Sep 2025 09:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756916414; x=1757521214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QnF8BNfXyuAru6baclj3+oa55Ds6fbybGGhhjoG/uZc=;
        b=kpaA3xwkjLm2TMlDWlMwY7NWP8+pNf0rRzwJIFWwPFWxmEba64sfh0hc3BOyO3GXj+
         No2zfy72LjF0AFSvJ0c5LjJpHOXTfWkvaDLth78NCGrUsk2kmCjZJkhQC+I6w+bskOkq
         udnYe/4Vd68HFl0Sfds8YmiY+AcQP5kvTFFKh49BdC/2oU6rYCZSj5I4WM59uvhkGWQe
         ME9wtblMtN7aeRbVu6x+USVDXuitCNESuKo11qKyOJChSwTDR4qBSMCrYRpJoeOo5gNT
         TARtjTk0ngn9LUKdrYjWUXqWWjiEh9cSVr6mIEP0wmZsdQqiGDW70Qont5UGulJGlWHe
         lCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916414; x=1757521214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QnF8BNfXyuAru6baclj3+oa55Ds6fbybGGhhjoG/uZc=;
        b=o05Q7jWHFskqRxITo/g8wIrFzW3BB6C40u7ozPOUKU9ab1Y5q7dOx9Q9hfPWskxlvw
         gD4PJB6wUaGWIsqAyZr0DQT3x+Dpzvqj5/QQBJZ7u779bKPjwu003hVOGUByif3s7L5Q
         vvNpdOkXO4AOa6SHHhL6l0M+vNRFBvgcRhHCXlUkw7Mo8Ew7hXWO3G8swBZsR2n/9jXH
         R3pfU2HXyRalCQpKsq4zBCO13T50Vzltg3X7eIfzuDxWFDZSBShbdsxQmlYClgvu8QUz
         I23eK2kCMuIkEMkl09l/4O02F9qV8Jog3O1+p3wCNiqGfigqV7JbfXd1pOJBkwNHX3ay
         UWiA==
X-Forwarded-Encrypted: i=1; AJvYcCUlsiRhyGrjIVs6R+/F44/eoAZ9XvbGg6P/6951421+m82EuANix+QnpYI4PqPXcczy5GP9wWLmSvO8CIHW@vger.kernel.org, AJvYcCVjpWMINIe0vh+sEINHujeZu8i96uBLDkb7w0BW8YpCd0iQD6OgBkAIatv0LTWQcp7DfEIzIYERGcjMQw==@vger.kernel.org, AJvYcCXN6UjxTKiDwMeQ2PkHnVZ8p1BlzYESc/QRjvaTFW6rk8IqLy6fdfkNIlpvmx0HOuaR+qOt8Ray8uiFi0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL+a1bxcwiFKn2OyRuRfLDQlvipcMLEdFnnbXr+EvduwSIZorV
	79aRLdD6BR+1/lPpZ6DnKtGZxfQoK5q+2CoUdgLXopduV/6S9vvqdUHu
X-Gm-Gg: ASbGnctwNJlDVnUVV1ej8Gi8qLSL/65CqDIHYCZq3rXRAo9KmIEjeRm9hMOFxeuenF0
	SFz0vOAN6EtNrOjEaGuKbVnmJ+fJHQC0/ZaJFsaT5wlaLD28AZ9OjILfbjFjDolBA93E5+vc/bo
	mDFmwBQaDqCmu42ife7MVASvQaUzI9oOmMH4Mqd8zKyC0mLJTpHEgubLE2Y94GXyKnOestRhaov
	t3th5rq9AwGHpPeouWJl4N6YXmSN8alSVP7vSZKyCEkMyeF213TCdEi2nRlsIwVyTSHKL5kgFAH
	Josu7yr+ivYC6Z1KGJkbSbeL0VDfvJhTUswNDW0y0xZE37I29gkMtWGS5CHQYDtfVgHuCeav5gK
	AijQ0lOCFOq06HA==
X-Google-Smtp-Source: AGHT+IGUl0u1MaURiqxVr7mw09y68mXAd1q5bstzJYKlQacOcNdemxbztOlPeCOdXiPUQKQOfmvqRg==
X-Received: by 2002:a05:6512:2508:b0:55f:4b53:6fc3 with SMTP id 2adb3069b0e04-55f708b1a85mr5113897e87.16.1756916413938;
        Wed, 03 Sep 2025 09:20:13 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad525d1sm598958e87.139.2025.09.03.09.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 09:20:13 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v1 1/2] input: rmi4: fix RMI_2D clipping
Date: Wed,  3 Sep 2025 19:19:45 +0300
Message-ID: <20250903161947.109328-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250903161947.109328-1-clamor95@gmail.com>
References: <20250903161947.109328-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jonas Schwöbel <jonasschwoebel@yahoo.de>

The physical max_y value was overridden with a clip_y_max value. This
caused problems when inverting/flipping the screen. Further it messed up
calculation of resolution.

Signed-off-by: Jonas Schwöbel <jonasschwoebel@yahoo.de>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/input/rmi4/rmi_2d_sensor.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/input/rmi4/rmi_2d_sensor.c b/drivers/input/rmi4/rmi_2d_sensor.c
index b7fe6eb35a4e..b4762b3c8b24 100644
--- a/drivers/input/rmi4/rmi_2d_sensor.c
+++ b/drivers/input/rmi4/rmi_2d_sensor.c
@@ -56,7 +56,7 @@ void rmi_2d_sensor_abs_process(struct rmi_2d_sensor *sensor,
 		obj->x = min(sensor->max_x, obj->x);
 
 	if (axis_align->clip_y_high)
-		obj->y =  min(sensor->max_y, obj->y);
+		obj->y =  min(axis_align->clip_y_high, obj->y);
 
 	sensor->tracking_pos[slot].x = obj->x;
 	sensor->tracking_pos[slot].y = obj->y;
@@ -149,13 +149,12 @@ static void rmi_2d_sensor_set_input_params(struct rmi_2d_sensor *sensor)
 
 		sensor->min_y = sensor->axis_align.clip_y_low;
 		if (sensor->axis_align.clip_y_high)
-			sensor->max_y = min(sensor->max_y,
+			max_y = min(sensor->max_y,
 				sensor->axis_align.clip_y_high);
 
 		set_bit(EV_ABS, input->evbit);
 
 		max_x = sensor->max_x;
-		max_y = sensor->max_y;
 		if (sensor->axis_align.swap_axes)
 			swap(max_x, max_y);
 		input_set_abs_params(input, ABS_MT_POSITION_X, 0, max_x, 0, 0);
-- 
2.48.1


