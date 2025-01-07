Return-Path: <linux-input+bounces-8987-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0FCA03816
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 07:42:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 573CE1885FB0
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 06:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697441DB362;
	Tue,  7 Jan 2025 06:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="a3kvIb1+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4D326ADD
	for <linux-input@vger.kernel.org>; Tue,  7 Jan 2025 06:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736232157; cv=none; b=Mm/0SzbHmf2G75C/afSOAb4RMPoNvOqMNuv7Nv6c6wjznwkW4Ca2DLAz6Bb7F4YwCrc6XKAmZkf/ON/eyg05FqOZPcxQ+WKMIRG9jliXekkzHNB3roGZuOvEc/Q0cbM34NpB1R5awdI++q57rT6xXk41e0lcg/CVC1/svIpYVrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736232157; c=relaxed/simple;
	bh=WCq2++j1FlddvZO65tbhAlvP5vwqsCnS16rr1toWSgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CjVc9B+MCHtjtxz8aEDpev5Oe7QisXREUt+6upyufWohJuG4uldG8eSyKu8UXwTwhFM9ZWRHI0wZHkEzPBAliSk7x7c1ZP9X5dx/hVogrIYdIgbqZntXlxoIRbnFCvYgkI3mugG0QOOI/xJ1k7mhw2JpgK68LaU3SAmQqzGdXFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=a3kvIb1+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F270C4CED6;
	Tue,  7 Jan 2025 06:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736232156;
	bh=WCq2++j1FlddvZO65tbhAlvP5vwqsCnS16rr1toWSgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a3kvIb1+Vb2YScr//PS42oqH1Zr8hequbnkZQBXtwPZEvrN3oxSGVefRrUGj2vD6K
	 JSx85KbhM/Kv89C4my2oP4bHe0hmHOKluZVuN2N7HIztUCQyJXhbugvrtzEOxgB4PH
	 /XExHk5cEZjb2yJWzVt0+WzvYeH5yTFWO0y7FJcc=
Date: Tue, 7 Jan 2025 07:41:47 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pavel Rojtberg <rojtberg@gmail.com>
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
	Nilton Perim Neto <niltonperimneto@gmail.com>
Subject: Re: [PATCH 10/10] Input: xpad - added unofficial Xbox 360 wireless
 receiver clone
Message-ID: <2025010720-guidable-profound-c3b9@gregkh>
References: <20250106225437.211312-1-rojtberg@gmail.com>
 <20250106225437.211312-11-rojtberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106225437.211312-11-rojtberg@gmail.com>

On Mon, Jan 06, 2025 at 11:54:37PM +0100, Pavel Rojtberg wrote:
> From: Nilton Perim Neto <niltonperimneto@gmail.com>
> 
> I've added the DeviceID of a very popular Xbox 360 Wireless Receiver.
> 
> Although it mimics the Microsoft's VendorID, it is in fact a clone. Taking into account that the original Microsoft Receiver is not being manufactured anymore, this drive can solve dpad issues encontered by those who still use the original 360 Wireless controller but are using a receiver clone.

Please wrap at 72 columns, I thought I asked for this last time?

> Signed-off-by: Nilton Perim Neto niltonperimneto@gmail.com

Needs "< >" here.

thanks,

greg k-h

