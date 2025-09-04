Return-Path: <linux-input+bounces-14476-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 110D9B43B6C
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 14:22:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D38CB166C27
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 12:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462B82E6CAD;
	Thu,  4 Sep 2025 12:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjpyqWeZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6612D663E;
	Thu,  4 Sep 2025 12:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756988545; cv=none; b=Bt9ofC4uelUqfy394jlKhCCo+s/+T5XWmPsbvOEIqNAp9yIlKS+Wt1Z7YjN/dlSC0Bcr43blqYL1ROGJDo3JJ1OolqD8NOPzV3lg7CjWj+Mb/9/4kfOMo8brF7y5DE4gNYEeH1oWPewNWcIQmfYARPMtQ7FaJ4MqMAGmL4bBJuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756988545; c=relaxed/simple;
	bh=w2milePpiKg5ebbBKr+UV2iTlwfW8Ly3ExrbfTnpXFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oL7kiW4RWFwE/TUN3EajGHQD95/qw5PVvDtAemQ8x0Q20NWj3DX349QdqYtr7R0bOAPArcvsq+lEeVDbqsio7NbNtWGCv/tX9Uo9CrYx5hjeCFRp6qN8w9HZCWRt+uMr83A+Xv7XqzBRZJVdaigO7yOaRHIQtk74LIlKUgl/iCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjpyqWeZ; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so919982b3a.1;
        Thu, 04 Sep 2025 05:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756988543; x=1757593343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=akIfZHFBSZrUemR48+sWD/tjQBCBJmfgvlQA6uuqfIM=;
        b=DjpyqWeZB48mE1vRDAfxHsshnQulm/JyMDOP46LPxfAR9hBHzpEY3Gwruk4fGmJXy8
         MU7r7WQqS4N8PbeUbBsXfCEAbvI1MNy7UjcSnIEJr7ZDxu+pexbHb366YpJyB/8EpNTZ
         UxHdN4NFFq74+hE5dP85RftkeRBY2S63L1Z2QGXc3Hd0YJh8k11/2Va3Fja81rjB4i8V
         JxYZ03CnsEUoSeq0iSIgvrpyHQZ+eVi1vOXs2KkI92gaAU5b4P+BIsvSWjiwVlMLHwLB
         KhrBVJVJUSkM75QQ1EKgAT+B/JnxYF1YGag5HRXnkGCiEF3wppZ28pJMxqAFS0prs6Rp
         IZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756988543; x=1757593343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akIfZHFBSZrUemR48+sWD/tjQBCBJmfgvlQA6uuqfIM=;
        b=xEFv/A24lIAbPZHFz98m4MUWu4pQSGs+JI2XR25+LnXkBsaudUdsi4LXbNpkx8BE8D
         KG6Z6J+eStk2eHDL5qnkNKW/pxH8ixtNgu+s0FdcA/G8C73iT9ux+h8c29iGKllE2nNa
         fad5upaUh9K9SzWYsjjhjLzcIIZzv2NWi8TdMI8SQ0ybGyKPUupVrUqaEan3qrAEtRBW
         PblAJ533XwvoexmJlaYgejo69QKYmtN6i5EHRyZj/49h8GN75IvtULzN/ZXGKTPBunqF
         sS0gGRq2I1wVXR7YXoGtxPOLL9CUOFr2RLl/F/jYsReSAgyoPiQrV8bPToAwFhaPolax
         OYQw==
X-Forwarded-Encrypted: i=1; AJvYcCV+KJFGhlsxtrNnpdxzztVN6uPEZPcpne9aBMwMzjTb0pam187jbE7iGVKovRFASIeYCjnfvlsDO0ILIeJS@vger.kernel.org, AJvYcCXsh+WCJ2UZUohlghuPEuw4H8V6Jd/LnsNRrn8I1A9bFZFTBWSlU0Ot+wkwfPnn8orWbbPMpk2HvUOsRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDun/5UpZ4c8luV2lVjzOgUT7p2rQMHGfz0AoU/WXANhOo8JuS
	Bi02q68XWLQyqVkLQdqFkqQm1Yi8bp9hDjsmgTVGc9RnkBFDjs5C86LS
X-Gm-Gg: ASbGncsg7cWmmB5miDi6C7gH5AAqpA02Tsg4BjbEtVjfeCr9KeosKIzwtLr0xGbN3oo
	kqRw7g/KewIqpXqmarKBaalt9v/b5DGiNBzLSA83MjVb/q2VUXu9OMB9ShmjVMb6W9mYiktzl/l
	bQSuxGQkuOsKCpyZ+y2GVpJEodtDqfu18UwAAKXfdO6YotaEbR7XkIJgpPjx7+xpAXw3CI5Wy+7
	J2PMkc+jKRKbulEpXp4xskdg9fnqqGl28JME92SS/KXkuBK2FmXK/b0AcuJ6hXiBGQqstxMkcke
	rcCQoOfHEFedtkc9efuWLK6jqJaS5KG0CrDYqZe0fPwnpVxN4fys7ItSDYi7fyBRpX5boMCPgvp
	K6PoL+SEuFfBg2WDow2CbkQbrnsgQjXcC9Q==
X-Google-Smtp-Source: AGHT+IG7ePGkeEzoYcaLi1YNv7WVN8ZVOE2olgqypEwCfnIM4FUUU/Bx/hwbojrMASWiqmw7kuTyCw==
X-Received: by 2002:a05:6a00:2e08:b0:73b:ac3d:9d6b with SMTP id d2e1a72fcca58-7723e24fe9emr21728734b3a.4.1756988542916;
        Thu, 04 Sep 2025 05:22:22 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:463b:8ef9:3432:4c09])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4beb67sm19266271b3a.65.2025.09.04.05.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 05:22:22 -0700 (PDT)
Date: Thu, 4 Sep 2025 05:22:20 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Nick Dyer <nick@shmanahar.org>, Henrik Rydberg <rydberg@bitmath.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] input: touchscreen: atmel_mxt_ts: add support for
 generic touchscreen configurations
Message-ID: <acakhrd7m7uigyqepxnaidrzpmftvxjaeybqlns6boujmzdzwq@lter6ek2b7er>
References: <20250903162327.109538-1-clamor95@gmail.com>
 <20250903162327.109538-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903162327.109538-2-clamor95@gmail.com>

Hi Svyatoslav,

On Wed, Sep 03, 2025 at 07:23:27PM +0300, Svyatoslav Ryhel wrote:
> This provides support for generic touchscreen configuration options like
> swapped-x-y, min-x, min-y, size-x, size-y, etc.

This requires corresponding change to the binding document.

Thanks.

-- 
Dmitry

