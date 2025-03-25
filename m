Return-Path: <linux-input+bounces-11253-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E12ABA70840
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 18:31:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B160218946C6
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 17:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8E7234964;
	Tue, 25 Mar 2025 17:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKDuDsEz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C45E19E971;
	Tue, 25 Mar 2025 17:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742923909; cv=none; b=AsbKjL9bL9wfr20Ryp6XlpTOzpKKA1VECH5MunecSicwP0BLi6wcJfIUJd0svOIVuF2kDSFDOX4OMi/hUWyljCbZphqjqPKm//mOkbkF83j8eaZrPypbRoNsH6C1nn1JTJRBBsGjCnSkOc5Xz5z5izEHYdn9ux2swtWj45tXHZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742923909; c=relaxed/simple;
	bh=dLf58HcvoCDMO7xEyKMr9WZxJir+JrD7Fikmuq9g5XY=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=TyI3zEpKiEjm+8WI6Zq5sJK1k6ESuP0Y1GOvQvR4x9f/EOKFHICXLHUElN3SEtW5A9YYENaMwpuUQXxBWfbJIkrU1glSzSXY20yJFUYtKqHZIRQYfORs3A18nKufSPi2wmiWk6v6vsAl+Y7iIsu8yXSdqjacbRmfrPPPfq9sBwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKDuDsEz; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c55500d08cso560714785a.0;
        Tue, 25 Mar 2025 10:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742923907; x=1743528707; darn=vger.kernel.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dLf58HcvoCDMO7xEyKMr9WZxJir+JrD7Fikmuq9g5XY=;
        b=QKDuDsEzIJnefp0B4u4YjFEW9+nnfy4gcHAwxcemHppdXmmqpEgLEhvjTfKqkI14wf
         zXH1P0WywA+dAvk+GSW+e+mO+B3oxtxyIPRBOm0Pa2ZrWBXEe+RTPCF1zvRD6bmdeL8R
         t+0pdBGFM/kVsOT8CwjPWvdjncPo4oHth94b87499zGXn/021Exk6kkBha866BBkaBE9
         W2w++rtONc7lz8hLUil/8oniuG8iPA+6G8NoN4Pz2GALP6HMn1PEMBfDzJTOsJ1Ae9tF
         zNk/jNVCQEOgppU8zT0klMsYk6cQzeif4CV8UcJfes5I29wauj53Zk5GoQZM0OM6OYo/
         Mu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742923907; x=1743528707;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dLf58HcvoCDMO7xEyKMr9WZxJir+JrD7Fikmuq9g5XY=;
        b=CeHa9K2I2FgpJ4t5NwZheOaP+jZCt48A8d+AVWwX4D+JRROAgUCTj1NV2vcLwAF0pr
         jvx99lzINAi2LlhYHFg6eEqaaqDpXpqitC9Cf+hHyTyPDFnOY7O55OGDidVTea8JTsKB
         QfAVyfXtRjB0fQbjs31XPVsXd8IM3GrwDM7Drvt1+Pd02/0itSSzAqaqgdkpKWCYCDzk
         K6AZcTxvOVj1Nm3Ogp/L0hMi/BkqwyWYP0zZZVdCReixuEnxpL+h0z9ynnnGdW/r8pYy
         jqk6zMvyXUU2QsfZoo0Qlangtyo7Ihatl/ffqCiw5K95cAj0BOJnWWoGyR181CfAfFzw
         +KpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaGMnFF96M9rzqIl019Z8yfxb7H4iFecjWvJI9qw/NDj+DNrL8HJ/S5PTA85H6MVmoU9WcxOVceNCVXg==@vger.kernel.org, AJvYcCXMPqZojq3ze1YxgNvnSoKt9fxvefDZbOkDsZVHgb15HRNH6T2PokiW+Yr8kKI9ysjA4kKC4LFndJQtkjdc@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb/5Xt1u+0RnU+wjytCTGhSaPVN/ZlPFpglpy818RowZg3wWAg
	TEMhZqciuo0QifNsJk+fNjw4q52n0ECQfXeAYL7wVky9ZqdcIwMm
X-Gm-Gg: ASbGncs1CWeoYbitWrHa3Ov4Xbwx/g6HxS0Qb7NV8gxn9RnblcUrYTilqpWLuVPNjqY
	2U4IUjX65kkPwkoOYFQb9GlsKvd6GAwf72e9EPRM8udlpD6pSE7WfKXCDVCoxuJuNUmz67mMFtu
	Pcuf/abYGn/z4wEmTVt7nnziGkYlacs+yXZnr7nRUcW9gxg6ZDwfccVBYv/jdaH4xLfAFtDGuMs
	xvkQA1g7izlCJPVSzkU3cwjVu03GmGfURsDBRi4rmXQNnHHMqgh8KgaHSX4gT6hgOniHDcvKxtr
	yXWuBlVyfLq/T/VPByXkLskDOwW4XP/UfM5fL/zPA6IT1gJpqKyWY2KH4tVumitvgveyMSX4END
	pfQ==
X-Google-Smtp-Source: AGHT+IEZaPr3Q9rgN66crHhd92PHXzKB7jY1snL+mD2zoFbBbjV4DRiP87hbutRJY2CS7a42I3eqIw==
X-Received: by 2002:a05:620a:3906:b0:7c5:4c44:db9a with SMTP id af79cd13be357-7c5ba1ee96emr2431514385a.37.1742923906653;
        Tue, 25 Mar 2025 10:31:46 -0700 (PDT)
Received: from smtpclient.apple ([2401:4900:5fb3:22d:b894:2ac5:970e:769c])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86f9f384e49sm2139156241.4.2025.03.25.10.31.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 10:31:45 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Aditya Garg <adityagarg1208@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH RESEND 5/5] HID: multitouch: add device ID for Apple Touch Bar
Date: Tue, 25 Mar 2025 23:01:31 +0530
Message-Id: <219B5F93-611D-48FA-A4D9-F9B71401A57D@gmail.com>
References: <bzb6rk7q7rs27kbonihpfftkgueievpux7vpqjgrgsud5pf5g2@tuxymj7vk3it>
Cc: admin@kodeit.net, benjamin.tissoires@redhat.com, GARGADITYA08@live.com,
 jikos@kernel.org, jkosina@suse.com, kekrby@gmail.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 orlandoch.dev@gmail.com
In-Reply-To: <bzb6rk7q7rs27kbonihpfftkgueievpux7vpqjgrgsud5pf5g2@tuxymj7vk3it>
To: Benjamin Tissoires <bentiss@kernel.org>
X-Mailer: iPad Mail (22D82)



> On 25 Mar 2025, at 10:59=E2=80=AFPM, Benjamin Tissoires <bentiss@kernel.or=
g> wrote:
>=20
> =EF=BB=BFOn Mar 25 2025, Aditya Garg wrote:
>> Yes I can move hid_find_field to the original location as well. But, I wo=
uld not want to devm_kzalloc as well unnecessarily if the touchbar is in the=
 basic mode instead of drm mode which will cause this -ENODEV to be executed=
 right?
>=20
> It shouldn't matter. hid_core calls devres_open_group() before calling
> .probe(), and calls devres_release_group() on failure. So yes, we'll
> allocate a piece of memory and release it after, but it's not something
> uncommon.

Fair. I'll send a v2

