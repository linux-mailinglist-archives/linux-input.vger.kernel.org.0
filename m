Return-Path: <linux-input+bounces-10555-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E21A4F780
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 07:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 218E516E296
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 06:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0261E0DB3;
	Wed,  5 Mar 2025 06:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQIqfsv2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C0219CC2E;
	Wed,  5 Mar 2025 06:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741157657; cv=none; b=chAGPYcCCOgQDgp8TorKhv7bGPUadOVCN7vf/Gwc9IlQQvxzSl2w5B0gBOG2Cw6w5h5/pPf7eNB8iSCYtZTmjfcRJKnNelgnM/OXcH1y+r9OcZCqq6oT+55p8gFQ6iYOudDKVfY827OBwi3ZVOHI9d8L2wQmrR4soyK7vGINgPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741157657; c=relaxed/simple;
	bh=lbrLsrc0f/KpgvFOW+aP7fOarbgqjao+EbshI2MGYTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fOX2lybOe0Nzkm3SRNTBs+WrNGoX72wIMYMbyibSt7frS2zxRo2td09iOyO1Ij4RnzqZVxxRClhJJ1e2NCtS9cms3Gvx0On1iB/jJq/vXaw0TQJNaEAGlBg3W0dv8QmrdmSrlSYCJD2sV831O80ycPIUNoWmcD2cVuNvvjHbCuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CQIqfsv2; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-223959039f4so73062745ad.3;
        Tue, 04 Mar 2025 22:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741157655; x=1741762455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pm3yCWSSanh1nyNMvpTXA2nPULwGPxjg/RKYPkuTPVg=;
        b=CQIqfsv2McWHMG7uXbfveNccj/gV4xUKpxuaYPAfJaMEYgbWxk2+dKF9M55VstCwa9
         ubZYsP4P7LIc4nud5/VGn9Mfx1ubJlRk7tw0ys1PjCeiF+Td3kDKFqN64ORcjhRonS+q
         Vm5l30gOW9n9q4brDe8JcRuCjsg6rhqqMG7CmhSDM5ggnAXX2cDruXJV7fUjg5oYd9Dp
         0wPJ/c15APb1lTwLhxcbIRwF5Hf4BAKJeUIUWegdhoWnR7y8hvj3V4EbZq7ix3lrDyZg
         z+cvgnh0gsCeUaSY41/RdkHgkBRwahCJlU03GftuIW99TovDUy5Gzk299ShJS4q6FMhE
         KHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741157655; x=1741762455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pm3yCWSSanh1nyNMvpTXA2nPULwGPxjg/RKYPkuTPVg=;
        b=FWy8Sn+wolt1kvjplYw8Opdn/0p1XkdClPu+23E+SlfpkLu6TTGrQGcKfomg6Xkpi0
         FAwUyJE6Y435cs2hUF9yA3n/9g8UzQLJGiokw8j4tUCsjKDRL0+85xz8C89xbF++DHsQ
         XAvllcibeyLy6irM/wEX2oLTYuSG8xA7kFv4oEwuT3npPuznj218U9uk+fEPqpA9ovRc
         JeC3r+rswxrI/lGyMXAjUDJagdjmuqbVHtYocUT/Prc8m34EKgS7gqS5TMNJnIvTZD4c
         +bBIKH3/pa4BGx6Tt/F+GjWO34r6AevRY2K+BIaOQ4B59WuvHl6eIp5GAq43ISPZNyBp
         U4dg==
X-Forwarded-Encrypted: i=1; AJvYcCUNfDfZVKPDpzyGwGSXraYSDHVk8+rdexmIIXOzJhssr8kjhQ9H2FmzsMo0zsA5ztonnI/LIjQWpe57aA==@vger.kernel.org, AJvYcCV0bPY55CfWa1wXvhqdPTqkLaRg4FzOVJIMhy87XND0nRquWIWEg7Jn26Nfm61A2gd1y7q4KAptidudTl/f@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5m0spbUTt0JvdiE5AB4OowouLNn5nzZNVf7KEXzKViQ8a5j1O
	wEGUz/fRAaMmX+bKwL/SRJLDHRAeckksY7w5c6s/vY3R1QDKdCF7
X-Gm-Gg: ASbGncvI98E9re41XZy6DoVZVknEUzKs3sLEbCJg3zNgL6n4p/eKKv+pUimJnnQXmwi
	tGl+gwQaghpb8ioKx8KCbLjav7I4HnYc55NdN4fzxV2LLcgBME5rZ8gnziINwddpO92HF0R8v1/
	6H92kJZwTlaMCl87lnLzteueX2yvYa50FU6sFXjJOAD2UAo6tH6JLVzIi8vrZ2aRi9uJf9QNC/C
	KEZxugcbkhivTk09UDXKqKWV0wbMR2xp7XDghjf2d3XNPYF84k/YI74Yy3IaCoodloJtoNkp6D8
	J34R2mkmiPNwPq5RI8NstamkoyMILFcGsB1YCIPr9mNJ4w==
X-Google-Smtp-Source: AGHT+IF2NcE4j3SzgHTM9IYbNe6hAbSXey7uBr6yRsyB9CgwM3JdBoX+IcmS9QwOxCq21HM6NTCSCQ==
X-Received: by 2002:a17:903:2283:b0:215:acb3:3786 with SMTP id d9443c01a7336-223f1c8011fmr29506265ad.19.1741157655133;
        Tue, 04 Mar 2025 22:54:15 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:438c:d5a2:41a6:66d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22350533186sm106833075ad.243.2025.03.04.22.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 22:54:14 -0800 (PST)
Date: Tue, 4 Mar 2025 22:54:11 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: mario.limonciello@amd.com, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] Input: atkbd - map F21 key to support touchpad
 toggle keys
Message-ID: <Z8f1EzASdCfa2h_7@google.com>
References: <20250303190442.551961-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303190442.551961-1-wse@tuxedocomputers.com>

Hi Werner,

On Mon, Mar 03, 2025 at 08:04:34PM +0100, Werner Sembach wrote:
> In the default xkeyboard-config used by both X11 and wayland touchpad
> toggle is assigned to F21.

We have dedicated KEY_TOUCHPAD_TOGGLE that is being used by several
platform drivers:

dtor@dtor-ws:~/kernel/work $ git grep -l KEY_TOUCHPAD_TOGGLE --
drivers/platform/x86/
drivers/platform/x86/acer-wmi.c
drivers/platform/x86/asus-laptop.c
drivers/platform/x86/asus-nb-wmi.c
drivers/platform/x86/eeepc-wmi.c
drivers/platform/x86/fujitsu-laptop.c
drivers/platform/x86/ideapad-laptop.c
drivers/platform/x86/msi-wmi.c
drivers/platform/x86/toshiba_acpi.c

Instead of piling on F21 hacks we should be using it.

> 
> This patch is in preparation for i8042 filter patches to be able to remap
> bogus scancode(-combinations), produced by notebooks uppon pressing a
> touchpad toggle key.

Since you already creating a vendor-specific platform driver I think it
would be better for it to register a separate input device and have it
emit KEY_TOUCHPAD_TOGGLE instead of involving atkbd.

> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Cc: <stable@vger.kernel.org>
> ---
>  drivers/input/keyboard/atkbd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
> index adf0f311996c9..2ba3493de88cc 100644
> --- a/drivers/input/keyboard/atkbd.c
> +++ b/drivers/input/keyboard/atkbd.c
> @@ -88,7 +88,7 @@ static const unsigned short atkbd_set2_keycode[ATKBD_KEYMAP_SIZE] = {
>  	  0, 56, 42, 93, 29, 16,  2,  0,  0,  0, 44, 31, 30, 17,  3,  0,
>  	  0, 46, 45, 32, 18,  5,  4, 95,  0, 57, 47, 33, 20, 19,  6,183,
>  	  0, 49, 48, 35, 34, 21,  7,184,  0,  0, 50, 36, 22,  8,  9,185,
> -	  0, 51, 37, 23, 24, 11, 10,  0,  0, 52, 53, 38, 39, 25, 12,  0,
> +	  0, 51, 37, 23, 24, 11, 10,  0,191, 52, 53, 38, 39, 25, 12,  0,
>  	  0, 89, 40,  0, 26, 13,  0,193, 58, 54, 28, 27,  0, 43,  0, 85,
>  	  0, 86, 91, 90, 92,  0, 14, 94,  0, 79,124, 75, 71,121,  0,  0,
>  	 82, 83, 80, 76, 77, 72,  1, 69, 87, 78, 81, 74, 55, 73, 70, 99,
> -- 
> 2.43.0
> 

Thanks.

-- 
Dmitry

