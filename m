Return-Path: <linux-input+bounces-12941-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E9FADDE25
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 23:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C4777AC56B
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 21:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 362BA2116E9;
	Tue, 17 Jun 2025 21:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ukmw66qN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AD22F532D;
	Tue, 17 Jun 2025 21:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750196736; cv=none; b=WK+vmOFUjAV8xyE5bjRoeRhJ9UmepClKFbfD5ShcQYiHu5zOBgcbJdjW00tyr5cUZm885t3fNOlPQiOG4Kr/esFanTvmtpKIt+TK3fqxuqmhQOI8HT+In6i5no/QXklKxfcyjIpQ6bEyvpVCSkQeHkOrCQdq3sYtwJVW5PrS/eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750196736; c=relaxed/simple;
	bh=A2dZ1FydLsjdosFBs2S/s6I1sWbxvZ1VSO4Zq83B8cU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OUq1OP9w57OA3j4NKIRMAxKOeXrczGMFSXAvWYH1/XtgEbeizt9BuEXOxQjTWvAg/vgrF77z8CzzN5n5EEkXv6hSWVT/EjZxCq3u++nVt9AQg9wpjpqdPFCUrcpDQZ7oh0/8yQRg2gcKI3b6IniXXKG/jkVcwR59uvOwz39x718=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ukmw66qN; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-748e63d4b05so52874b3a.2;
        Tue, 17 Jun 2025 14:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750196734; x=1750801534; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mWGDSMYpyw8lt+t15kcZ/I10gRihJeyPecw1qRYQqXo=;
        b=Ukmw66qNPiTsNS0/iWJhBxTJlvmDbLQh2K0bhALrTT8EWpANd6BKuozmdpJrMFrnY3
         X0zTyGq7HT+NLCTJNjnthnWLj/LRM5rYvkhkDmRz7hgdypNkppHQ/by09VxytGfBhxV/
         HqFRe0LtN1ivdBNP2I0fAGrgps3GDOMRFlJxj1g7/AirWTmBUKLpczQ7qZ69Hjpug7DF
         rvgGnRkdJUsGzO23TMgOX+UJZJz64jSAtIJt6d79Fc12WNc7ma0SHI/StMV8iPm3iyal
         FXiryFATzttBJVZ5DFfbFHWVnND9IG71aWMKbxTltinFmXbFj+lDcHuqQNb1iWFTRsih
         nCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750196734; x=1750801534;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mWGDSMYpyw8lt+t15kcZ/I10gRihJeyPecw1qRYQqXo=;
        b=A2o0OKxC3dbKeTjaQzd4VgAgXJs921RRMMSRD4qrfHFyFxcrXQ1L580iGlBMONAmDW
         Gf8TlUvbLhrU6D+MdU95Uv+OKmGMgLXSxONvJ9eEmjHjR/WgiT4SLQ5fCHMvULJHf1vB
         JMX2PhmzCxWLXRFA753Sg/6Y9QKDpyyHaIvlq6tWYKwbr/3/6Mtqzew64vJ3c/XaFUjr
         ldmU3W+VBTpKoT25RjzScgmyrFUc9TNh8b1LcwCkN8uGytETDVNovFgP1jeU9XUo73/1
         f3vII6M+GUQ5gDbsuAOoG+t6SX7dzX9N6nJh516SlTDi9J6QFpwy5zOdffF1/84CNS6v
         e9+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWc/hdp6x36WNnuK9u6Hy2flXar13LDuk2KsN48Fp8Qzxj8lh/A/9vzCYPI2/PF0wNnVge+jSLlJWvO1+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVzx70t1aKRt/i+NZdGhLjjHfUeBd19Q3ZufXSrpOf6nqrN7KU
	XVHO0BTP4YX0VuUCbtDgSrNRbECQ1v5lg4uZkl1/N5NQ+gXVfbQiZDGCOaIpTw==
X-Gm-Gg: ASbGncse+dQE29hUHMwU4tLJ2ieVXhIKrZiqNuExa/4oVU8VLTekheKrfw+vMkU18KW
	CZ3RDmCnuIX1YsCSzNVSHtruiEPIjPGtVRyZ0nTYPkQWOqqR7ZpBFY6Dg3uf6QPAhi/kihsLmAS
	S231f1LZITWfd1PZbdHl8S2q9enyUSQDA4p8B2ycmxLznl2c16Qkld9pqvt7IsWhBmXhrLQ8soT
	dJyI2COvM3hjlVurynZy+OHOO0Uoik7Me++V20JR5lOaWKcUiZavUyeLFwwecK6IwQP17Hz5H+B
	JwUcyT1RSUrW0I5AIDaEnVBCG1CybbRnZfAeP/blSUVuKEzDq8LcF07sv5adN/8=
X-Google-Smtp-Source: AGHT+IGlTLm2QzaRXQQgfTm7Ofb51W3vZc/F8hoXnGBBvG0yp4Gle76GRdK2dvAQaKe1EQg7MCDw/g==
X-Received: by 2002:a05:6a00:cc8:b0:73e:10ea:b1e9 with SMTP id d2e1a72fcca58-7489ce45c6amr19314598b3a.6.1750196733802;
        Tue, 17 Jun 2025 14:45:33 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4cd9:8b8e:24cd:5a36])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748e684f54fsm95377b3a.138.2025.06.17.14.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:45:33 -0700 (PDT)
Date: Tue, 17 Jun 2025 14:45:31 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add nokbdwakeup quirk and enable it for MSI Claw
Message-ID: <lgedr3vr65tlmdt6p7gsd4cqlhgtadu5gj63ibwpzjuaxgrnwt@vlp3utkui3fh>
References: <20250617051930.3376981-1-matthew.schwartz@linux.dev>
 <5isz34mtyxezwrhmvtedygszhhnstsqa4dmcttb33p5dgw47st@3n6wswp2p6di>
 <98727492-5E7C-41A5-B0EF-1A21852FFB05@linux.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98727492-5E7C-41A5-B0EF-1A21852FFB05@linux.dev>

On Tue, Jun 17, 2025 at 02:33:34PM -0700, Matthew Schwartz wrote:
> 
> 
> > On Jun 17, 2025, at 1:50 PM, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > 
> > Hi Matthew,
> > 
> > On Mon, Jun 16, 2025 at 10:19:28PM -0700, Matthew Schwartz wrote:
> >> This patch series aims to solve an issue on the MSI Claw, a series of
> >> handheld gaming PCs, where their volume buttons will wake the system out
> >> of s2idle because they are registered via an i8042 keyboard device. This
> >> is not expected behavior on a handheld device that lacks an actual
> >> keyboard, as it is very easy to press the volume buttons while handling
> >> the device in its suspended state. 
> >> 
> >> To solve this, introduce a new quirk based on DMI match that will disable
> >> the wakeup property of an i8042 keyboard device and enable it for current
> >> MSI Claw models.
> > 
> > Why does this need to be done in kernel instead of having a udev rule
> > to toggle this through sysfs:
> > 
> > /sys/devices/platform/i8042/serio0/power/wakeup
> > 
> > Thanks.
> 
> Yes this would work, but it would also mean relying on individual
> distros to discover such a udev rule is necessary and figure out how
> to ship this as a device specific workaround within userspace such
> that it won’t apply to other devices that do want to maintain i8042
> keyboard wakeup functionality.

If you submit the rule to systemd repository then distributions will
get it when they update to the new systemd release. Very similar to the
kernel.


> I will investigate implementing this
> via udev in some sort of packaged fashion, but a kernel quirk seemed
> like the better option here in my opinion, especially because a quirk
> system is already in place for i8042 within the kernel.
>

Quirks in the kernel should be used when they are needed for booting.
When configuration can be delayed to [early] userspace then we should
try to use userspace solutions. This way we are not wasting unswappable
kernel memory.

Thanks.

-- 
Dmitry

