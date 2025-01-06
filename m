Return-Path: <linux-input+bounces-8950-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 781DAA01F90
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 08:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67A411625E5
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 07:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F461D63DF;
	Mon,  6 Jan 2025 07:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ld6hlJI6"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F841D63D6
	for <linux-input@vger.kernel.org>; Mon,  6 Jan 2025 07:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736147369; cv=none; b=u5Qj0VDTMLScd7oEQoTjLdLm29n/q6BDAVJljbHL0PpONkd+pS/cOvb53eo3pgHJQCG7+PBz9POwi01iXE6BU/LmbKKbOZfTXJblNm/eY9+LwaZ/9skG/bw/Ih8870bqja06yoeV4cDxAY8ObWzp3hd2mlUDrCrk7mg6nUCFkPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736147369; c=relaxed/simple;
	bh=J2aE7/BfWdKXavs9l3ILNitUVl2Qcm6V333wqVCLftA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jf0Zbn6iP0b30K7OiDT5u2HNB+Cd33pOW/nulztbKIXltAZpgkRGA7lsFJ07Tbnyw3UFy/9oqPYEtGUZrX8oZEDSq/atkCpeIHzYjuPmcf5eClANWoNFpdXKu+YWPIgeoa9CgBZboHj9ZuPYU3fUh1BLfwyfJAwTbPkYuN6ba8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ld6hlJI6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A303C4CED6;
	Mon,  6 Jan 2025 07:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736147369;
	bh=J2aE7/BfWdKXavs9l3ILNitUVl2Qcm6V333wqVCLftA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ld6hlJI65lxBwlZZe7Xvaex0VAba0h2wpsOyeiND1kMQouzMCY4SJuyUumV1NHGIk
	 O9TkDL1Lv2FnrU8A6hKLBYwv0hhzgUGwU1JfKMUn9sbD278kMK21bfM7Wj0r+SlnMw
	 u9AlBUO6uwIJQVGeKuL2ol+GuQ9AU3H9ragS1g0E=
Date: Mon, 6 Jan 2025 08:09:26 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pavel Rojtberg <rojtberg@gmail.com>
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Subject: Re: [PATCH 00/13] Input: xpad - sync with github fork
Message-ID: <2025010649-rumble-embattled-7187@gregkh>
References: <20250105193750.91460-1-rojtberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250105193750.91460-1-rojtberg@gmail.com>

On Sun, Jan 05, 2025 at 08:37:37PM +0100, Pavel Rojtberg wrote:
> From: Pavel Rojtberg <rojtberg@gmail.com>
> 
> This updates the list of supported devices as contributed on github.
> 
> Andrei Ilyashenko (1):
>   Input: xpad - add support for Xbox ONE liquid metal controller
> 
> Fernando Petros (1):
>   Input: xpad - add support for Thrustmaster ESWAP X2 ELDEN RING
> 
> Greg Savage (1):
>   Input: xpad - add support for PDP Mirror's Edge controller
> 
> Jack Greiner (1):
>   Input: xpad - add support for wooting two he (arm)
> 
> Javier Zepeda (1):
>   Input: xpad - add support for Nacon Pro Compact Model NC7271
> 
> Jocelyne Jones (1):
>   Input: xpad - add support for SCUF Instinct
> 
> Kikismine (1):
>   Input: xpad - add Hori Racing Wheel Overdrive for Xbox Series X
> 
> Leonardo Brondani Schenkel (1):
>   Input: xpad - improve name of 8BitDo controller 2dc8:3106
> 
> Martin Stolpe (1):
>   Input: xpad - add USB ID for Nacon Revolution5 Pro
> 
> Matheos Mattsson (1):
>   Input: xpad - add support for Nacon Evol-X Xbox One Controller
> 
> Thijs Reus (1):
>   Input: xpad - added Turtle Beach Recon support
> 
> Tobias Görgens (1):
>   Input: xpad - add Black Shark Green Ghost controller support
> 
> jdarn (1):
>   Input: xpad - add support for 8BitDo Ultimate bluetooth/hall effect
>     variant
> 
>  drivers/input/joystick/xpad.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)

How about just 1 patch updating this as giving credit through github
accounts is going to be messy with bouncing email addresses and the
like.

thanks,

greg k-h

