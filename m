Return-Path: <linux-input+bounces-15659-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C233FBFDB8B
	for <lists+linux-input@lfdr.de>; Wed, 22 Oct 2025 19:54:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A5D8A4ED11E
	for <lists+linux-input@lfdr.de>; Wed, 22 Oct 2025 17:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58EB52E11B9;
	Wed, 22 Oct 2025 17:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6GFqhoo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2822DAFDE
	for <linux-input@vger.kernel.org>; Wed, 22 Oct 2025 17:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761155683; cv=none; b=BK6zpqN4lH43krMbHccTFoIns3OtOSLzZQj8AqXbJb4Kuy000TgR7HAQ8P8HH3bJLf1e9YzcCsl312fTxt0UXeTfHPNAqhJn0HXQL/iaZQo0ZBMHHY1KjTNfPJjykVUnNPTfcegnp+No1rske4D5thlTZz+ADCpkh8clLiAiYqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761155683; c=relaxed/simple;
	bh=B1AUVikLodwQzq7iTiyB+43RNcbtAThA47OKW3pcpus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKsmerjlyfI3BBs6zvgxlGmS5yMi9x2Nzte1YQFiv9qH4ODn+mr+OxLnaqp5WQmVdlv6qmGzKg7SGPMclHgL0l9TynPcpP/0EiYOiJY0huLQnBoYYeo/kesh9iZSF/eFnuhcilNXQuR4fouSeeuOHz/nqNvV89LIAyojyeHo3Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6GFqhoo; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b6ce806af3eso676224a12.0
        for <linux-input@vger.kernel.org>; Wed, 22 Oct 2025 10:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761155681; x=1761760481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x478lQk2DxPizTI77gXgyAfctUUWFoIyeH8cqYHygmA=;
        b=e6GFqhooWSHA8JPt+KCn7IXb0ra9KZAqHkmGtruuXFUXBbZYC4Ko1SBH4X9ydLqnxa
         3ptSr0OxNCN5cIOsa64E/thsMB3f3yMCzcLCzBdJY4XpPF+NfNVmcycmbO8C4hva/i25
         3jRAF0XsfcdEoTurYpbWxOFOUTUnPquCmpoPfhXZo8XryRT6x0sQdrMncxbKff7bRQPx
         Z4l8IByosoeEr5w95+uRoAysGlZVzq117ZjfNzRE0VyuiwdkXVw7IQVsOYClWq2bkMz6
         v26PbTOY2z1xsZDbOnUssOxpJJq9mP1BxcGxvIy47cFEVEVh4SgQ5ERe26S7Jo6tzKnI
         2W+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761155681; x=1761760481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x478lQk2DxPizTI77gXgyAfctUUWFoIyeH8cqYHygmA=;
        b=aMUXMwcaL/pLoWKa6BeFuQQf34bU/qYhnN2B4GV2OTMR1pGgDU81BuaTRQkiMp+Rls
         bPbZRKzXQtQwF+j/MNaP+TWou2CPJBHYz0QVhzxBMY8DsYJlCmEwzVuvAeq6gjTxX1ha
         JPbrZHRDcfcG4Hn1x2lkPNo1NjSmUGeG+CxSoLIGT5mF4V0Wre29nN+YJbd8Qgam7SD/
         X7WludmVbZ6cnXZd7Gz/8DDmZE9A4gWQ76ONbjyYI6z9RDyc7PiuX3FIZrClHsWsSyTx
         Js5JvcR8zdQe7awkv/p+z/F8tmJNna6xMu8Bum44caZIVXfDCe3OJwyg6em1ybpjaJ1l
         m0tg==
X-Forwarded-Encrypted: i=1; AJvYcCWnrSCVLqxRC3DTn2B/ldOwGLDjGkMrhfOeUrpS6+aerWKHGQYdyRuDVKTr07t7lky4oc2AGRVTs4TvSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBP3K1y65ZmFLjLZxnuRdujmiorNk/T339SYYFjkOtFsm5A5gp
	BpEtS5dZdaaSa3tZ5MXNMBXXxsexivDBWy/wcGnkygRskJ0oeiVr2AdA
X-Gm-Gg: ASbGncvdCfLOP5TYFZy5TyT+h8tgs7vqdWYpaDu/Chvh/7wBkHLNPaiDcdXMyKENOO0
	ZLNzCZ1flL2s+CBDrZ6m9vdNjag3a6zP0E+kzxCKYTsQ7uOrgAyczIe2cYbkCCAydGknXogATIE
	Ymyoy/QoiiCiKJ3eeRtPtVMiZpeSZYEaZNP9G5SCg5tFWb47JMI0n9kP1c9WFk4Bo9HZNM/tkfA
	jBuAJNbi9gJZtCZx+hIxvROr19pIBPajB6QHHFKfnsFkzTjglx36+CLTDTopkTmGBEdiBjRvxTI
	M7KM1mTo9iSTR52d2IGzsKvlch6EuHiLwpP1nR7gRx2dHtfEr+Uwm6LNZLxNpeyPzoEQch9+Tnl
	LQAXJcjIKGZOX8X8nbWsq45CLGWIb/iFKcHNYM6wgok5M/X8NcwrQP67EWJZ7nMjKkAWhISro02
	pGDkR/9E5EzAr6OvU3z9Ctwg22WdbaEmL7NwwD4xClM592LyCGpw==
X-Google-Smtp-Source: AGHT+IFzOHo/RMYqhcqswj+hl6niGwcGNYYYyzF2qwE5VOSZ6yskOvLvhqKzp4jJuFDjqUzcg0pA5g==
X-Received: by 2002:a17:902:f64c:b0:28e:cb51:1232 with SMTP id d9443c01a7336-290c9cf8a6amr285299295ad.3.1761155680885;
        Wed, 22 Oct 2025 10:54:40 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:53a9:459c:bdc:6273])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ec0847sm144704115ad.22.2025.10.22.10.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 10:54:40 -0700 (PDT)
Date: Wed, 22 Oct 2025 10:54:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 0/2] Input: Add keycodes for electronic privacy screen
 on/off an use these in dell-wmi
Message-ID: <wcrbaqheqhzpjcg3au2c5xshwwed5bjyvl5u5pske6ru7lggjs@yjpnfdbkogba>
References: <20251020152331.52870-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020152331.52870-1-hansg@kernel.org>

Hi Hans,

On Mon, Oct 20, 2025 at 05:23:29PM +0200, Hans de Goede wrote:
> Hi All,
> 
> Here is a patch series for adding support for the electronic privacy screen
> on/off events send on e.g. Dell Latitude 7300 models.
> 
> On these laptops the firmware does not allow querying the presence nor
> the status of the eprivacy screen at boot. This makes it impossible to
> implement the drm connector eprivacy properties API (1) since drm objects
> do not allow adding new properties after creation and the presence of
> the eprivacy cannot be detected at boot.
> 
> So instead this series adds 2 evdev keycodes for eprivacy screen on + off
> and modifies the dell-wmi driver to use these, so that we can still
> propagate these events to userspace for e.g. a DE to show an OSD.
> 
> Dmitry, can we get your ack for the addition of the 2 new keycodes?
> I think it will be easiest if Ilpo merges the entire series through
> the pdx86 tree with your ack for the keycodes.

Yes, that should be fine, although I wonder if this is best modeled as a
pair of keys or a single switch? I know we have touchpad on/off but I
wonder if it was the best option... Probably more convenient at some
point if it was done through the atkbd.

Thanks.

-- 
Dmitry

