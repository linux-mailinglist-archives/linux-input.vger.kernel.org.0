Return-Path: <linux-input+bounces-7132-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9CC993F6C
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 09:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17BC31F2501A
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 07:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D193B19923D;
	Tue,  8 Oct 2024 06:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hphEndy5"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A945C190693;
	Tue,  8 Oct 2024 06:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728370096; cv=none; b=gbe0H8lQjRy1WthlC158AMBn36gzM+EU863OzNBO5go4vbimp6xd2V+7xkMf1H0Rg0on0wkLVKVPRr3+4Ya0g/Sr+DAjhW+CElgwE0yoNY9yf1Bo7gUYZ08Dh+J1U4T9eRa+waAN35BVQXW3v2dwK4VI435S0yOznEwoHf+1jpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728370096; c=relaxed/simple;
	bh=Y9uXHn5MjiPMxjCdOgm/9GRcWyxpGpZmyN00gYTz/3g=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KiuUOd8Up7LW5BQO1ocBXNfE1gI+pE4WUC0v4oioqGDUGZo7ItSjUGDIzLk/vvm0aFCwLF5Wj6bGDxE4h3zuMafmF1mkdk4L4op3rgeNL8ba3mJZVDD8hEd6Jjt/vDCq4lnv0wRFyO56BkG9/lYkrQjMnv5+0LWBYREcmUUx5DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hphEndy5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E1FC4CEC7;
	Tue,  8 Oct 2024 06:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728370096;
	bh=Y9uXHn5MjiPMxjCdOgm/9GRcWyxpGpZmyN00gYTz/3g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hphEndy56HRVVjDupSe4sQb+X9gyDFNsQmxsdbgoqMu16zVdcu7/phDB1ik1IYaqL
	 RjY2NAWH8g20lJgbDDt+L8SY8/mCxiDTxbGoVh7KGEH0AapvTyjLB/yO0p4hV9zwDh
	 ITXKUB7urzybJYuPnT0Zk90W7h/qnrGIPTonVYEpS5ZcyINlmmHy9ciBU8v2U9qwl9
	 LBYPcHhuemzkn5RF2MBXmwHATvRLfQCs1uvZk20IyyAwx6EtgFHU8qguOUYovqtuky
	 oSElSebLM9hdPLPKqU0KfhTrjcfEPP/ofiB5f2W19WCzpGeNCepTY7xGyE24hbNRGa
	 DLcoFWoDI8RAg==
Date: Tue, 8 Oct 2024 08:48:13 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Bastien Nocera <hadess@hadess.net>
cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    "Peter F . Patel-Schneider" <pfpschneider@gmail.com>, 
    =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@riseup.net>, 
    Nestor Lopez Casado <nlopezcasad@logitech.com>
Subject: Re: [PATCH] HID: logitech-hidpp: Remove feature_type from
 hidpp_root_get_feature()
In-Reply-To: <20240916115532.1806755-1-hadess@hadess.net>
Message-ID: <nycvar.YFH.7.76.2410080848020.20286@cbobk.fhfr.pm>
References: <20240916115532.1806755-1-hadess@hadess.net>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Sep 2024, Bastien Nocera wrote:

> Nobody uses that variable after it gets assigned, so this saves us from
> having to declare it in the first place.
> 
> Signed-off-by: Bastien Nocera <hadess@hadess.net>

Applied to hid.git#for-6.13/logitech, thanks.

-- 
Jiri Kosina
SUSE Labs


