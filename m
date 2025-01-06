Return-Path: <linux-input+bounces-8949-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8167A01F89
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 08:08:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EC531882910
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 07:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F10D1D5CC6;
	Mon,  6 Jan 2025 07:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DnisXFq+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797598BE7
	for <linux-input@vger.kernel.org>; Mon,  6 Jan 2025 07:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736147321; cv=none; b=tfMHKZBTzvNqu6jKF45Tt+VUEeTQXFYHTU50cjChDlwaMTDKKn26tk8xR8rshy2Fpkirb+oCOFJ3s4rOoVWEn3ute9cNiUR2sjwUbcVRkRd9qQKYcl3PloBxE8SIFdrma/EimrY0aTIVNnoB9eNMcrazdomIcMDyf2Jis9g/1YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736147321; c=relaxed/simple;
	bh=lxgZ0T1LzYElXMPOIopsAFxJvw3H+bRQSt9fIlEVOD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOu+VZ0TzJuHgYdpH5JMACY8yf+G++AgemZrtDVX6bQ0mH4jIKpMoElg5tGfSnliMbHvoko6QvtbbQags4MTkuOfsJk8rENC1I9opkzc1FdwuVhgXUO3sTxAJdgT5tcvqxVoknrtbqPB3oGofG3MCtj1N3+cMuOG4ce7AnopSLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DnisXFq+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D803C4CED6;
	Mon,  6 Jan 2025 07:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736147321;
	bh=lxgZ0T1LzYElXMPOIopsAFxJvw3H+bRQSt9fIlEVOD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DnisXFq+wGEba4+hrYX4+wCeLsWCjyh8hztb9MgLEdpvph7n/CR5WQj3BnxPIdiyx
	 9k9QVLr7KVNMQ9z8hX4DZI58P0iLwP6O8f13umWQ/QYg3Alg1OWzhY5sMn2fs5Tqkg
	 m3M4FL1FHnXcKKvUBlKuushUAvKLGnVM5unzEMDs=
Date: Mon, 6 Jan 2025 08:08:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pavel Rojtberg <rojtberg@gmail.com>
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
	Andrei Ilyashenko <andrei.ilyashenko@gmail.com>
Subject: Re: [PATCH 08/13] Input: xpad - add support for Xbox ONE liquid
 metal controller
Message-ID: <2025010625-matcher-idealness-517a@gregkh>
References: <20250105193750.91460-1-rojtberg@gmail.com>
 <20250105193750.91460-9-rojtberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250105193750.91460-9-rojtberg@gmail.com>

On Sun, Jan 05, 2025 at 08:37:45PM +0100, Pavel Rojtberg wrote:
> From: Andrei Ilyashenko <andrei.ilyashenko@gmail.com>
> 
> I found that my controller wasn't working with this driver.  The LED would light up and it could rumble but was not registering any button presses or joystick movements.  I suspected the problem might be that it was not being sent some required init packet so I tried sending the packets being used in xboxone_init_packets and found that sending xboxone_pdp_auth got the controller working.  At least for my controller xboxone_pdp_led_on was not strictly necessary but I decided to follow the same pattern used by the other two controllers.

Please wrap at 72 columns.

thanks,

greg k-h

