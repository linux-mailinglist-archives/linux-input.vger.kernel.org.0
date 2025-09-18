Return-Path: <linux-input+bounces-14845-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E2BB83E49
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 11:47:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 758497BCEBD
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 09:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C6F22ACE3;
	Thu, 18 Sep 2025 09:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z6jAe6vD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D503B34BA50
	for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 09:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758188824; cv=none; b=UaOkBjVYE3++pjb8nhzch4bypoPbRpaSZjB+fTs7ET+EvBGOx5ueSqm4xrxqwOktCcwLu03A8l77EBhtdhW9AURHMxaFc6zPyZZUwj4Nx8Cx9oTJN1KOr4/p7u+fANelhLKlX3fl58TBttylBrwX+ECRqtdMGPSld14W4WeQfDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758188824; c=relaxed/simple;
	bh=zEvTASiG3P2Dm0le9h1ivUXS+sQqbHxOdmdlgXLuCT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lpxQWULNV9j9ZbhJfpYY/5fQznek22qGV4g0IMcaPlmUVmtGKsaa1I6b70xXPZmzM08jZYuJ+P/UlFx39tGLoh4YfwAiXICm0gSmGsXGV1WxXP65dNWjQiyiRS04scQfoxCfwCv4JZDm5V04U1pMW+Y46lagUHiLoJzQllaCwJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z6jAe6vD; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45ddc7d5731so4460535e9.1
        for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 02:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758188821; x=1758793621; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fRu0VNNe7H6T2Ps3BYzOrbHogKvek/JK5mXdZQlAHY0=;
        b=z6jAe6vD33+vG+KkdGKbkzjrFfeG66adU4HerGKyyIm1u175RlO2sLfVmDdCVT+b1L
         44IMHyK6U81Z2oonUEbTcfQVlpJBvvMfXExTmbGrHFngv5jmF4VHy1uuVu+v4XCJDi+o
         B3W0NdtdRSOpKaqpdeWZXQT1q+mHIF9sUKC1lpR0XcQembWTiADAOp+pDY688BhHuMgj
         CQYD+fhaHgixqN+/Fsy1O2JQMOM/x9Ex+lvtCKpVqMLPGzv28E/9BCJi1krcqcsKEQ6f
         KPmGeRSXwDqHcJB/eOZslCojYjDdv6BSoceYDh7ia9vJFl7Y1Azsd4A1UAXF+fWnaqG1
         7pAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758188821; x=1758793621;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fRu0VNNe7H6T2Ps3BYzOrbHogKvek/JK5mXdZQlAHY0=;
        b=s6dobwuPfLnx5E7GVqg7T3F5jiEtoAexP6h41ml0bVk0z3c0reysDVkkZUL1mM/w2V
         bkJpyPyueEU4tyRe2GN8Avt0P4X8rk+YA8BDBH9+xdmFsBhG0MX2jPZ/pxd0Z7YYOz22
         WW24ACQaP4QmXh+gdrToZuJFqabw66uK4s0n21+XJHF86ij4fbtvuAWq442GACfxuJ/x
         q0qJ2YGwe/2evEeh+O35j43WGG81X7jbqRKegPLcsje07HrkPRsk31OTFsTKwrNHlsOE
         CCrKc0YJxynqjOoqIIVH7RENzRnmGGIJVfsXtFgDFOv6+Yy2EJJkyqpqWLBUytQEikvF
         xjKQ==
X-Gm-Message-State: AOJu0YzKm8rMZQAGKQgYW4ZPwNZav4DxZJtKuZ894wO+BoN+1jv4bNCo
	5LDO/esVcMMDDEW+5pJ1Rulx6wf9dXeaXzeCTXadJRIEu9a+sJi44pc2KwaAHzylPN4=
X-Gm-Gg: ASbGncu2E6Ud0EAXUzJ71qAZ4hEoqohFtJVXlRc4bigd5sekFsRUvWj7RymUgorplsm
	H9pvVz7SNkSRwb5W3ZgfbBzP8CeXB7vfC3ccX7xI5f5vDBM1eMxeXUctjdsGLVfGiids2I7TeTb
	3vCnxuCsquwpR5/Y+O9kbz8HoEmyWKByBi6GK/xebd752qsZzENhwrhaedfhW7Se8/yNzBPxhvR
	vMwDDpr/DDJRlF2MBnPDEzKqx8zvFK8MZQ8ib8miwPqMoTdbanneIvjZlYg9q+ju0JfwDuAAjqw
	2V0dWbW1M6ewQ02kecQVt+d9azPEywlag+HxQK4ALJbWWgb85a4xRaAkBxKOT/G/gYLO/7naOEA
	q/cGcXZowmygCOqqEtAdlvwHCcHnO07Y2sxyAFH9WJht2uoTQmUPmM6L1
X-Google-Smtp-Source: AGHT+IEgdPG5ozMrKoTZa6MxbLIPwOwHNrIxuwLMbdQkPlyQ7gmIsOQIG8LqwykYthAF1Vrfaoxi6Q==
X-Received: by 2002:a05:600c:1390:b0:45f:28dc:60ea with SMTP id 5b1f17b1804b1-46202fc930fmr47439515e9.15.1758188818367;
        Thu, 18 Sep 2025 02:46:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46138695223sm74393125e9.5.2025.09.18.02.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:46:58 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:46:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Angela Czubak <aczubak@google.com>
Cc: linux-input@vger.kernel.org
Subject: [bug report] HID: haptic: initialize haptic device
Message-ID: <aMvVDjG-80rVMkz0@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Angela Czubak,

Commit 344ff3584957 ("HID: haptic: initialize haptic device") from
Aug 18, 2025 (linux-next), leads to the following Smatch static
checker warning:

	drivers/hid/hid-haptic.c:193 fill_effect_buf()
	error: uninitialized symbol 'value'.

drivers/hid/hid-haptic.c
    147 static void fill_effect_buf(struct hid_haptic_device *haptic,
    148                             struct ff_haptic_effect *effect,
    149                             struct hid_haptic_effect *haptic_effect,
    150                             int waveform_ordinal)
    151 {
    152         struct hid_report *rep = haptic->manual_trigger_report;
    153         struct hid_usage *usage;
    154         struct hid_field *field;
    155         s32 value;
    156         int i, j;
    157         u8 *buf = haptic_effect->report_buf;
    158 
    159         mutex_lock(&haptic->manual_trigger_mutex);
    160         for (i = 0; i < rep->maxfield; i++) {
    161                 field = rep->field[i];
    162                 /* Ignore if report count is out of bounds. */
    163                 if (field->report_count < 1)
    164                         continue;
    165 
    166                 for (j = 0; j < field->maxusage; j++) {
    167                         usage = &field->usage[j];
    168 
    169                         switch (usage->hid) {
    170                         case HID_HP_INTENSITY:
    171                                 if (effect->intensity > 100) {
    172                                         value = field->logical_maximum;
    173                                 } else {
    174                                         value = field->logical_minimum +
    175                                                 effect->intensity *
    176                                                 (field->logical_maximum -
    177                                                  field->logical_minimum) / 100;
    178                                 }
    179                                 break;
    180                         case HID_HP_REPEATCOUNT:
    181                                 value = effect->repeat_count;
    182                                 break;
    183                         case HID_HP_RETRIGGERPERIOD:
    184                                 value = effect->retrigger_period;
    185                                 break;
    186                         case HID_HP_MANUALTRIGGER:
    187                                 value = waveform_ordinal;
    188                                 break;
    189                         default:
    190                                 break;

value is not set on the default path.

    191                         }
    192 
--> 193                         field->value[j] = value;
    194                 }
    195         }
    196 
    197         hid_output_report(rep, buf);
    198         mutex_unlock(&haptic->manual_trigger_mutex);
    199 }

regards,
dan carpenter

