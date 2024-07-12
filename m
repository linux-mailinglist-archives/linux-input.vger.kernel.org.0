Return-Path: <linux-input+bounces-5001-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C1B92F638
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 09:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2F501C22CF6
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 07:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B971422B5;
	Fri, 12 Jul 2024 07:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Jh94sQZ9"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E241E1420BC;
	Fri, 12 Jul 2024 07:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720769381; cv=none; b=DUTF0gpjhl5SeHVdwL4euYjNQT7ui09JrT6ivsGlBBYrXFCv5PO+NpFTgszN4ACFyiJr/erupAVEkLUkvUXvSh7XtO7hQ5Zs/vw2EOGs2cPX4MiE5ndNUOEPkB+G6smxza3VW+pY50SC6Yrvilil8HtoUnHh+LK0PwAqmRQeYX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720769381; c=relaxed/simple;
	bh=QDSdzXf/3S9QMIdebQthB2/I05LG3uz5mYmKAsXy9m8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hv/41s3uUWGel4OTWOlW/+AwMiwY/XfWefyTWpTKaL3xjZcsRalq48NiZF4a7M0HWsbFRLW4Hdwl38cxrzFxrZsBx82ZaRhvBs0RqJkuMe+tb8dOk85EGHcyY9Q9McQJkq5LjslDGyR51kS1nFXqTQcUre99i0ykc6pMYHQItx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Jh94sQZ9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CB1DC3277B;
	Fri, 12 Jul 2024 07:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720769380;
	bh=QDSdzXf/3S9QMIdebQthB2/I05LG3uz5mYmKAsXy9m8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jh94sQZ9DSqzwr954bkGTmtXY2Wof4cvG83EgZ7VLDh0iAE8MhxzZ+MUZ8yA71juT
	 dO1yqaX9VcvHqUwzs30rhyS8Z3r3elOuURMmxybTnW0O21ImGJ50KyhyabmGpGDht9
	 VrTYkedvVMoQyearVTW6q399uk3+KKkVNN4dNupI=
Date: Fri, 12 Jul 2024 09:29:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] Input: usbtouchscreen - remove custom
 USB_DEVICE_HID_CLASS macro
Message-ID: <2024071232-reabsorb-rebound-5bd7@gregkh>
References: <20240712051851.3463657-1-dmitry.torokhov@gmail.com>
 <20240712051851.3463657-2-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712051851.3463657-2-dmitry.torokhov@gmail.com>

On Thu, Jul 11, 2024 at 10:18:44PM -0700, Dmitry Torokhov wrote:
> There already exists perfectly suitable USB_DEVICE_INTERFACE_CLASS
> macro, use it.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

