Return-Path: <linux-input+bounces-13178-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C78AED3AC
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 07:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBDDB189260C
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 05:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5264518FDBE;
	Mon, 30 Jun 2025 05:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T36SYToV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDDE2745C;
	Mon, 30 Jun 2025 05:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751259930; cv=none; b=CfotQCc92ZnNoXyN6rblVyHN2z6fub1+godQLXnNuZKM9RcOTyIMS4wEA8yUJ1kvH4qEW0oGEyBUvCSn5ViJmiDCY5dZEQcckthY6hiA9QBtFOYeWUmLQoOFySBPbmq2ykJGYDIB4dA4Lmp9a9lJf+Zcby5Io1qzIppaQ1iKtMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751259930; c=relaxed/simple;
	bh=ha59LqtikoA9ph44Fd0vlqvHyEtWhZb4hYcYbbMdN7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YkzZnHoyBDNXeOFhQsB9j6iFsnRgI4tmFxn6LAmlj2jJlyYglCyhVbqDLFUavNCXV+UpZ4ikqcgya0mmzRk94q4SbgCfodd36yx+SJlGqZkoBEnp3SV9oiL9fklzqmmlYuEtrNCE1g6jb26FXn3lHl+A53Ae6ON6TyLgZpP3VIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T36SYToV; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b3507b63c6fso806880a12.2;
        Sun, 29 Jun 2025 22:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751259928; x=1751864728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ov/z++fhLQvoUzZFvE8VhyZn4UXeRaYvTSODvWNuVWc=;
        b=T36SYToVg/DJP6BVlX1JQACx5PVHOjO8VexgIiijmiL4mMqYm7hsBnQjnUtfCEFJ2E
         8e97mrNXj7lvJXZLlknx0EL9eRM0CiGvHxx3FF/LIt6Ryq7Oq2O2cuDgGU9B5uYSgtZW
         ZSo9U5e6IBdjACmsAsoV27aXOUKIjtkuuxZK0vFsdvHfKUdNexKWvsp/gbiMp1r3etPv
         hXw1q/0du+pcxVwfXhdYcxVB2XPW95YiVQNbTscgh69W7pl4ycWLVR+D5/IwT+TAW0ch
         ttUIz2ayorDiuqdKPyYV/uQWUvLIUMYrxvWIxYq+ZcaBMbNXZKG3Y9sIqxQDcP2aun01
         QZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751259928; x=1751864728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ov/z++fhLQvoUzZFvE8VhyZn4UXeRaYvTSODvWNuVWc=;
        b=Sbfnd7BcTB/3G+DVuczyaEZgs89yc1LGg+/93eYRUsmabL3J9sft9Il2aQi3hrjk0h
         WWt6TxMygmH4BY1uvKTiKxqlTgrYLrKwo5XpXHhUMEzTz2umyXvANk+e7+JdnWcPOAIx
         QcBfjqDtb3kh+/J4JaWdKma0EPe7FAlUnCp9QuYgXf6p2GIM1OkGMqo99cU6b35f6SUe
         JyI50YZ6aM57044mpEqPlni8U0CFlUE1ln/7Kt+yAdE3Kra8GndOZtLufOoFJ9FstjSo
         NPg/wKSgkKbPU7f6XgFv9g9No/NaKnW8nk5K83i1nmxQ6bPrM9KhI2JZ263pz1FWcpEM
         630g==
X-Forwarded-Encrypted: i=1; AJvYcCUd5+dnFWSjd51uOGGnHgVdFJQVNHUnX9svxJfBWAEvgsZTkmCAAZX+QuQb3tuTGF7LgpD8UG9wlcHlVA==@vger.kernel.org, AJvYcCXTa1Nq1HKmwS4iMmUWtmk0gVtdMiCfTsOEVJuYLVg7nlG92ImmTd4VlXH0iu0hZb+wSPPXJp8L/MCAkSpH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7r/m96HCU63glyKClY59VGJU7k0kb9mGy7+yVTpQkmBzBrIlt
	pbTnKq1qVJCWtQJlt+r3k7+ZVKcxOb1xXyf1+TWJPEHBOde/ZdQfJYg8lNMiJg==
X-Gm-Gg: ASbGncsiu9J6aFXU0vIVldQvBa6/Wgr0yfODO1zyL1isWT4++NUFVTMogsjbgcnoUJG
	3dj+SY8QIElC+4FJr0wcPk9iK3CGU3wMxy83rslPhwEuTmBym4GSKFM5Mm3zkDluxYri+MKAJAa
	0MfEfL2/fYbFgIQAV8XHinNDSGww4sHNrkTABwBvfTl+IOMnyLzPY4HVKIx+Wlc7kpsEQ0/GJiW
	Gwj9KoZDcB62TGTJFALGUA+AX0kftrzg2QkgP422fnRu3hWy8B26PaQ+Zt8VhZ0zqpIzSYlcnuf
	09SGYxaBkiExvoVKLSlBsTMcB18WMg0Nj8kthIHHLni9HmhwB1bzUl4r5pJE1g==
X-Google-Smtp-Source: AGHT+IE1KXUTZO10dSbZL5bmC6ns+ZIOo3B1G6U6Hj9crZBQXq4kqZEgh46qZKMMNIIftPtoRBp2uw==
X-Received: by 2002:a05:6a21:38a:b0:21f:419f:9019 with SMTP id adf61e73a8af0-220a158ea9emr16698573637.21.1751259928140;
        Sun, 29 Jun 2025 22:05:28 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c92b:c666:1f8:990e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af56cb98asm8006808b3a.126.2025.06.29.22.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 22:05:27 -0700 (PDT)
Date: Sun, 29 Jun 2025 22:05:25 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux@treblig.org
Cc: lee@kernel.org, linux-input@vger.kernel.org, arnd@arndb.de, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: pcf50633-input - Remove
Message-ID: <j3pkekg2mmbdbmguewoc5rks7263rxhveggkimbhmvkgxb5ikh@nwz553og3qtz>
References: <20250629212820.319584-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629212820.319584-1-linux@treblig.org>

On Sun, Jun 29, 2025 at 10:28:20PM +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> The pcf50633 was used as part of the OpenMoko devices but
> the support for its main chip was recently removed in:
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")
> 
> Remove the input code.
> 
> This was originally posted as a set of pcf50633 removals in March,
> and is the only major component that hasn't been picked up.
> https://lore.kernel.org/all/20250311014959.743322-1-linux@treblig.org/
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Applied, thank you.

-- 
Dmitry

