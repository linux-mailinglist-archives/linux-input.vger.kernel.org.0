Return-Path: <linux-input+bounces-3735-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2688E8C91B4
	for <lists+linux-input@lfdr.de>; Sat, 18 May 2024 19:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 132C9281764
	for <lists+linux-input@lfdr.de>; Sat, 18 May 2024 17:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D69B45024;
	Sat, 18 May 2024 17:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bLvtPKtf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0C22E3F7
	for <linux-input@vger.kernel.org>; Sat, 18 May 2024 17:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716052734; cv=none; b=FJ4BygjP21JH6ahaGk991gKawLy4SxiA1lFX3PE5EqSH5HVc2P0YnVZBrhUjPQyIxbv9S9KB9utED/Rpt7GKLqBrY60q15kFCwDqiWIAv/xOf3DHcKN1pALQ1rUfYDYa9CKqodC2SHcGCb6mGbJvbXp8WPMIDRG40rg/0yn/slk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716052734; c=relaxed/simple;
	bh=//8QV5TSiMfT14T+L5Dni8yVPWQI23EOE8lPHpMRkQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/i/iBBxhvIFCW7oEiqrIKOa5B/Bgpu1P3oCOTGdwGghOYb2TO05jdMizYsv484oM63k6Qz0REKz/mJ0W4cZV8TSb+qGZZQrPEsyBq/1k+i91gTSZM1HDZcpUt0nZlMrhZtiilIlbXuGVDPtGGIy+mBTS0mv3klCGf+UEMfTG5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bLvtPKtf; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f0537e39b3so37473525ad.3
        for <linux-input@vger.kernel.org>; Sat, 18 May 2024 10:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716052732; x=1716657532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bI35mSpFGv5azuf3W34PAy5g+Nwe9xTUDOP2VBYb+qw=;
        b=bLvtPKtf7AAWUQL7+1BKfBQFilZk/h/+9MqhYx3/ShuBC/VbG7djvHzsS5IkURC66Q
         01vQjZEIk0vVLgNCnqrW31X87xGfJIH8Zb0RGjsovgioPJUSOqmnKHV3pz4gKKRjv+vk
         ORI+VxKwcJWNGn1ZIf67KYxyKfGxIkGDJCZMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716052732; x=1716657532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bI35mSpFGv5azuf3W34PAy5g+Nwe9xTUDOP2VBYb+qw=;
        b=HqI3LIrc9Q1ohO2XBkSYjfK7+c8BPsbwz8x1X4ai+OYtgI8eAZr+4fjKNZzfO2KZAs
         CpfptvN84surV63i9l/+/78NbwYs9Yjx5LXhYo3d5Yy7j8FcRiFsCMSDaD7eqJTXuyTg
         WwQQhfn46sr8kynncBD+eQar+0lvNCtAU0Cbc+7gvkyCoueMISVBVV6AscRm9SdH1BEZ
         IT4Sj3uKiP/U4iVhV8hDlmO3ZJNIjAn/bFAXqIkmY1MKLhhFMh4J4mEoQdkwaotYAn42
         9PgGf5kHpogKmbf77FEVKWkDB9ar0xmAo9OecXdc5FQOkWPgIGOntjpLSNOJpgRLDtfC
         AriQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI7qjD6MsfkADXo5sqrAaYTzTAvW6V4QMMt3WcNarEX8PtAhLM1rrNVaxLUtnPLfKReTA4gDcidVjAzMlrl/XH1hlvnSL/z1Hd1OI=
X-Gm-Message-State: AOJu0Yx2Hnktwq3QbfQVmu5G02nQtArE9Qg0t3u8o4ic5u6vnwHgpiM0
	weRHZvdLZ1F72VQw1dyUQ1Qz87tcadmP6O4F2pXElHdBN0HMXWt4nttPhzNuVg==
X-Google-Smtp-Source: AGHT+IHnTm7HxB1ifDLOfll4lXfhQucVtONb5bXh+in0GA9Emo8PEiZzBgcOx9HwsOaXGa4JlF1tXg==
X-Received: by 2002:a05:6a20:5602:b0:1af:cbd3:ab4d with SMTP id adf61e73a8af0-1afde120e4dmr22666060637.33.1716052732590;
        Sat, 18 May 2024 10:18:52 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4fff45ce3sm11294743b3a.197.2024.05.18.10.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 May 2024 10:18:51 -0700 (PDT)
Date: Sat, 18 May 2024 10:18:50 -0700
From: Kees Cook <keescook@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Jiri Kosina <jikos@kernel.org>, Shuah Khan <shuah@kernel.org>,
	bpf@vger.kernel.org, kvm@vger.kernel.org,
	linux-input@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 1/2] selftests: harness: remove unneeded
 __constructor_order_last()
Message-ID: <202405181014.B84D979BA@keescook>
References: <20240517114506.1259203-1-masahiroy@kernel.org>
 <20240517114506.1259203-2-masahiroy@kernel.org>
 <202405171621.A178606D8@keescook>
 <CAK7LNARpvZ5AeH9HXFPupD_Jj0Gw4D6MZ5iR7uvVwnm9nSg9CA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARpvZ5AeH9HXFPupD_Jj0Gw4D6MZ5iR7uvVwnm9nSg9CA@mail.gmail.com>

On Sat, May 18, 2024 at 12:29:00PM +0900, Masahiro Yamada wrote:
> It will be set to "true" eventually,
> but __LIST_APPEND() still sees "false"
> on backward-order systems.

Ah, yes -- you are right. I looked through the commit history (I had
to go back to when the seccomp test, and the harness, was out of tree).
There was a time when the logic happened during the list walking, rather
than during list _creation_. I was remembering the former.

So, yes, let's make this change. As you say, it also solves for defining
TEST_HARNESS_MAIN before the tests. Thank you! I'd still like to replace
all the open-coded TEST_HARNESS_MAIN calls, though.

-- 
Kees Cook

