Return-Path: <linux-input+bounces-9718-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B212BA25BB9
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 15:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC0A4165CE8
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 14:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE10204C38;
	Mon,  3 Feb 2025 14:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdoNMsdA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E77111A8;
	Mon,  3 Feb 2025 14:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591223; cv=none; b=gEikXXitnNalYeXrTKy6c7yhQJuM0uZ2l+5aEoYufELwsG8BhSS/9G79McYWHasbnSHHSq1ccbITV+kWgXkbn9/gtf5xfXFmxbc347MLR+YFd4mCncTSuYho1KFegWtaaKXAsyqw/W0wjrzXKwKgiKlYmuvogOUP0AN4B/JC3kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591223; c=relaxed/simple;
	bh=sFw6a6CBGX3CJQLHB6uvFLA/efvDiB+a7slUqjZU1do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FLkvKfn/30+jNWc5Z7OF2unHUzQYeus9KZicEq5HPSHrQYlozmZ3y4Cr/1vfa/jqvl2+ZdyENaL0vBPtAWbk9itGatcjgp4dxpjSL6xlYwaiAivBRS4dUNYy7FATKLblgW79DYyb0EH3WBJXLUy6AjS03YAOWyAFtOyjRv1BYRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VdoNMsdA; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-218c8aca5f1so87388375ad.0;
        Mon, 03 Feb 2025 06:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738591221; x=1739196021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pj0X7gimYNbIdGaKy+0N9jNbkyEy+n6mQW8Dp8j+2Cs=;
        b=VdoNMsdAmErNn3DqsJxbmDjre4uMlDsigErsqncEI8XPIzHTPdNrusdfhqnsIk0Oi2
         +qerCwnunKYao9TiCIJCmVZul0t0p2l+ny4fzRxygcvxz4ejEZDxrTQkBqVHa+ZrT7Ko
         tKb+UlREnEfMhUsrZNIZBhlAqe6q4SUgAeLWr1ZNB+3Q+///ZbNoAa8GFMC0QxZFg6Uo
         W+QQbygxZzB1eXvXGn3X4uiXWHwv95zqo5zZqXZRGASsEv2ScYb4Ejma71oxPKN/g7GV
         fcWeW54ua8d58DPtVfspQ8+Idm83+xFiY9yTyWEqJkFAbwsqQg8W3PPp6uPwXnRFaWNT
         gnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738591221; x=1739196021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pj0X7gimYNbIdGaKy+0N9jNbkyEy+n6mQW8Dp8j+2Cs=;
        b=vYnQUtPzGMApZBWD//EV57s8N9uq1tkqIJ5BT/KrwAp8HiIXBI7mu5eZ8xlao2tjBD
         Ll6lvuiJXgdeSZvPFQcCNl/bb6hRw1+UhA7uLwI/w2fvuOi4F01ZiAhaAyeRn5+tUZ9W
         bMKbGAVQH3m924vIBAaSFA1wJHzE/YUMESvl5VTsQOAiY0VP7xr0HlvbArCTcNI+LYjg
         0PMW0JofO9d1YLhjHHgXyBHy/MmImRCHplirZzVpiExzEg6wAzI4OE/Uo0irZBR4QyVV
         jHYfGO3QOt92lXGPhChIioV8fSrKbWywtLos3pCrCuCyTXRvb8XU67f7bSZd37PTS1eh
         Ro+A==
X-Forwarded-Encrypted: i=1; AJvYcCVASC0I9yp1BAONQy+idNpkKR5WFqbTpRwe/skxnzu3oxIpWJgHouvAt03FyZ+cgMUIh3poclqWGCypCcY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPohzWbwyZTYYmAwDfAeX/9TB193UETlOC6bAfSHWQXkijcY/7
	+TWcRF/PeqFhbZ9Er4RwcprlDmzOSqOHrvvSPMCiEFnL1Dv5p1bsiPP5j9Wn
X-Gm-Gg: ASbGncsKiXolMGGJWv3GPqj5zp3twGwapyVLHl0NZAZ25c4ipphDXD6SIU/fqCD6ug/
	A9P+RE7xSmH5WB6cFsgKioe9iJim9YgPGlcChv/HMq4JeQH/5ZJQxVnNGvUfPgXeWjTigFSRZEH
	F8fkF2Jq2jIjIF6JPRxtxiQxDM+FMDqbAV29RjJUEAR3Ls72Q62yEvLissw4GI1LzHhUZcHtuC8
	6H9AiaMKBCub3dioBQY9M+4EdaGP85JlckW5hDFHxHDIybZVutzPoP005tgUCbQfNerqF2p3Wzl
	RrUyEnNOZSAWJGrm
X-Google-Smtp-Source: AGHT+IHC4ljZnye2fYYzTrG8E2a6wT/HWcfxGLvpeyBRdqSi9lFX7cnVJl5DGUArJZzCX+u4II6hAQ==
X-Received: by 2002:a17:903:40c9:b0:216:73f0:ef63 with SMTP id d9443c01a7336-21dd7e38f8cmr343177275ad.49.1738591220788;
        Mon, 03 Feb 2025 06:00:20 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:bc03:a12b:a196:21f1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de33200e7sm76750375ad.240.2025.02.03.06.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 06:00:20 -0800 (PST)
Date: Mon, 3 Feb 2025 06:00:18 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marian Flor <marian.flor@posteo.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio_keys.c: Send also event when EV_ABS axis button
 is released
Message-ID: <Z6DL8v9hzkzfH3is@google.com>
References: <717e71d6-5114-45ff-aa6b-0bb4a68b6261@posteo.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <717e71d6-5114-45ff-aa6b-0bb4a68b6261@posteo.net>

Hi Marian,

On Sat, Feb 01, 2025 at 04:20:15PM +0000, Marian Flor wrote:
> The input EV_ABS does not emit an event when the axis button is
> released.  It appears to libevdev as held, even when the axis
> button is physically released.  This behavior is also opposing
> to the devicetree documentation for gpio-keys.  Change the code
> to additionally emit a zero valued event on axis button release.

This unfortunately will not work: if you have several GPIOs with
progression of values, such as:

GPIO1: EV_ABS/ABS_X/0
GPIO2: EV_ABS/ABS_X/1
GPIO3: EV_ABS/ABS_X/2
GPIO4: EV_ABS/ABS_X/3

You do not want the values to bounce to 0 as they transition from let's
say 1->2.

The "return to 0 as resting point" behavior was originally only supposed
to be valid for the polled variant of gpio keys, but commit fbfb9a60d5d0
("dt-bindings: input: Convert gpio-keys bindings to schema") changed it
without updating the driver. It was an oversight.

To properly implement this behavior you need to scan all other GPIOs
with the same type and code and see if any of them are still active.

Thanks.

-- 
Dmitry

