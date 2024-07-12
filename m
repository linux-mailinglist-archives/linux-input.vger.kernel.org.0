Return-Path: <linux-input+bounces-4997-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F4192F62D
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 09:28:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04FF31C21E1E
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 07:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 050F013DDC3;
	Fri, 12 Jul 2024 07:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XIui4GnM"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20E013D8B4;
	Fri, 12 Jul 2024 07:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720769327; cv=none; b=Oqa3+vS0oWZ45ngxji/oSf/PKeiGvQS8W+RkYMIlVTeElXG8whA/zLjbAG8ZEBc3Eq9LvZuv7HeJx+Diw99J2S9ZcPYLyEnUbeZ58D20bzuc76yY90BwI4dio/9ql3M3lXIFcY37CUSpMHSPaCUOxvrBMGoEEQzVW4NArWwbUao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720769327; c=relaxed/simple;
	bh=NZB6kclYfO1BcunzQWM7Cs8icVBvchbLHK1yPfHLkS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FyQX3HzzPwshfPERPS9mxSBx1MQcqscKHfwJ8hu38dfki6DMJalny0g+HmRKZ583g/qniiY6Yaq9pvQLVaJe6g/spiPm623V9dNWWDDhCqnVWYKY+vZfTASSmbmmebb8tEZdq1gUtvIriDkSxhIXDjbVS3S1/JnFPDMH5+BPolc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XIui4GnM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D618AC3277B;
	Fri, 12 Jul 2024 07:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720769327;
	bh=NZB6kclYfO1BcunzQWM7Cs8icVBvchbLHK1yPfHLkS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XIui4GnMr1sdx5CReaOJZJj9ZfKNSMor/6yRaZjMwWZBMrJipaw0tx5nkwtte80cD
	 JjSugVxCthoelss69Ps4StVbyC+rSSpp56RghSNrp82taboejNbSvuO78w8XOpRSj0
	 Vos2whqkFLBN+RULNkGxjfwc9Opehol/VRC0lAJ4=
Date: Fri, 12 Jul 2024 09:28:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] Input: usbtouchscreen - split device info table into
 individual pieces
Message-ID: <2024071239-vest-landfall-6637@gregkh>
References: <20240712051851.3463657-1-dmitry.torokhov@gmail.com>
 <20240712051851.3463657-6-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712051851.3463657-6-dmitry.torokhov@gmail.com>

On Thu, Jul 11, 2024 at 10:18:48PM -0700, Dmitry Torokhov wrote:
> Instead of using a single table containing information about various
> touchscreens and enums to match the driver ID table data with chip
> information define individual per-protocol instances of
> usbtouch_device_info structure and reference them directly from
> the usbtouch_devices ID table. This is simpler, safer, and uses less
> memory in case some protocols are disabled.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

