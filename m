Return-Path: <linux-input+bounces-3516-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC4D8BD6DB
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 23:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B8B6283B59
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 21:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89ED215B57B;
	Mon,  6 May 2024 21:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TRVkSZF4"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602DAEBB;
	Mon,  6 May 2024 21:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715030910; cv=none; b=fHGM3qkQB/uBXlEktwTP71i7eUDGZnT0btTv0iJ48FAiKjQAYxgYBgzk3L5UgK0WnXgJKIbODX9T8bwBDG/Kk336S6VzpKxGqomyDA0DEMP/dH+JSE/jZ2INjTD4vRi5GpS2Zdx4kGfsVtRfPiM6UVu1+FJlrK00G6BD08y8z0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715030910; c=relaxed/simple;
	bh=JA7evhWLJ0IZ4zTkJf05xGBiQ8YPkHnZLXlcFVlni7w=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=eEQ1kmTa/m4VMPh2ob9IAn8NtVtnfMbb3WttHvkdAPoDhCAQXs++TOOvBYZ1eMHlk1IJiOkojh2kjPX/FWfNzTwcaqsien25YQn9AINlo1lYmr9mlubkE/Sbyuyfv2YhhXlTwz/b9tRbb8iZKFurH9q3aHc2JpK91pinjvrZbKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TRVkSZF4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59602C116B1;
	Mon,  6 May 2024 21:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715030909;
	bh=JA7evhWLJ0IZ4zTkJf05xGBiQ8YPkHnZLXlcFVlni7w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TRVkSZF4kcolQMYOiDSpr+qCzH4NnNEIuxWXtmMbfte6FQtEWSLtEy2VmA44IfkGI
	 Aft5AG1IjlkJtVGcl8eGgmtstiCB70Y+AsqcUjlfMnLbPO8iDtZZZ2DQR2CIpvOUTu
	 wE5EsCKiWZV8Rrh159QeRSPm2wGaIBdcTOl/BJRq71UpBlaYqZUomXytkbmTM+esrf
	 Ettu0iO/JWyd15W1z3PrfCDFwtBDjIOIde7ZKc+g3gXHDAmJHXp5f4FpUqwgzeU2VZ
	 poI6x2n0rbCfnVABHiT1gZUsAjmpjQcWCv8N0CBr1r4Kv9OruUWG8n0GX/5s0cswlq
	 JYNp7s+K3BlzA==
Date: Mon, 6 May 2024 23:28:27 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Kenny Levinsen <kl@kl.wtf>
cc: Dmitry Torokhov <dtor@chromium.org>, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Douglas Anderson <dianders@chromium.org>, 
    Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <mripard@kernel.org>, 
    Kai-Heng Feng <kai.heng.feng@canonical.com>, 
    Johan Hovold <johan+linaro@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, Radoslaw Biernacki <rad@chromium.org>, 
    Lukasz Majczak <lma@chromium.org>
Subject: Re: [PATCH 0/2] HID: i2c-hid: Unify device wake-up logic
In-Reply-To: <20240429233924.6453-1-kl@kl.wtf>
Message-ID: <nycvar.YFH.7.76.2405062327550.16865@cbobk.fhfr.pm>
References: <20240429233924.6453-1-kl@kl.wtf>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 30 Apr 2024, Kenny Levinsen wrote:

> Third time was not the charm[0]. After Dmitry's comment[1], and after
> looking some more at the I2C drivers, I have given up on removing the
> smbus probe for now. We can always revisit this later if the situation
> improves enough, but there are more important things to fix.
> 
> Instead, go all in on the address probe with retry and use it for both
> initial probe and resume, replacing the previous retry on power on
> commands. This gives us consistency and a single place to update and
> document.
> 
> [0]: https://lore.kernel.org/all/20240426225739.2166-1-kl@kl.wtf/
> [1]: https://lore.kernel.org/all/ZixvUNooESC02cJK@google.com/

I really apologize for belated response to all this, I've been completely 
swamped for the past two weeks.

This is now queued in hid.git#for-6.10/i2c-hid.

Thanks,

-- 
Jiri Kosina
SUSE Labs


