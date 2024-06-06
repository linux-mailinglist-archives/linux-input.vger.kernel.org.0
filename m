Return-Path: <linux-input+bounces-4159-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6531F8FDFC6
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 09:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3890284514
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 07:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0692D7172F;
	Thu,  6 Jun 2024 07:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hF3ZZpFv"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0ED17C68;
	Thu,  6 Jun 2024 07:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717659090; cv=none; b=XKhQ4BjdKxRJCRrJoLdcboXX26R+vsIRsuw+Oi4iX6gGswNPyXV5iyN5PzT97BqyRja0x2FkSpyx3zsldEuD5PdWJCPSyA7g5I1YlyXQW2wE3soWLJKxEMzW3FZZ+LQMg0mubwO/75P9HyL/LQZw+tl4P1KvXtwPji9CHQCUyq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717659090; c=relaxed/simple;
	bh=rexqNs6DIXrZr8f9IyDDcoZTN25PLa0sMb+0aD1Yo48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdN/Vpke9fJyFeDj0XyyY1UoRXQJHV/Z54s7agnPVTTO23APtyjqjM2/hI2IucUIE1RTNpnTfvO7S+PTqeDCRuoSSHHm30YEnF07eLWfUzO0NfvQYDkSRSlLl5Es2FmPPlO/pfdmbiphX/1rB1iUPLDeDyMylNkBbKWZwYRvGUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hF3ZZpFv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28268C2BD10;
	Thu,  6 Jun 2024 07:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717659090;
	bh=rexqNs6DIXrZr8f9IyDDcoZTN25PLa0sMb+0aD1Yo48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hF3ZZpFvTUMJnlAZO9gUlGA2k4H3CA8sm7p7G58YmpHIyxBTqb93iWGvFUlvL/4W9
	 837PErXoI1VfO812U22PR+qXXFLzO9tmqU0RnJ49ANMY2BdjExiM7icFuOP45ABoAM
	 P4esoG4Wt8i017wHt5nKHrsAp/cHMVT63q8W6JxMHLYdr9W0AuZ51eyF/G6PZHBM1V
	 xnpwWQk34b6VBZb3vnuOYMciYuyMpd4Tsewx/3MQBtPkpWtMHXcoSq+/rtANg/B7b7
	 Wel9BYuZRi+vdPqy6pi9tF2pJvABu15LKjwSO0c3NvxUs2jKuHkzfh7VIMFmikuL0a
	 gli8zM/qATPDQ==
Date: Thu, 6 Jun 2024 09:31:25 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Danny Kaehn <danny.kaehn@plexus.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Jiri Kosina <jikos@kernel.org>, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Ethan Twardy <ethan.twardy@plexus.com>
Subject: Re: [PATCH v11 2/4] HID: usbhid: Share USB device firmware node with
 child HID device
Message-ID: <c2evceueqyofilzwkwiyzzq3u7l2ehrslkd3247qglqbesaunu@dioqr3rv4ebi>
References: <20240605-cp2112-dt-v11-0-d55f0f945a62@plexus.com>
 <20240605-cp2112-dt-v11-2-d55f0f945a62@plexus.com>
 <ZmD4IFFHmUkDtUeL@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmD4IFFHmUkDtUeL@smile.fi.intel.com>

On Jun 06 2024, Andy Shevchenko wrote:
> On Wed, Jun 05, 2024 at 06:12:45PM -0500, Danny Kaehn wrote:
> > USB HID core now shares its fwnode with its child HID device.
> > Since there can only be one HID device on a USB interface, it is redundant
> > to specify a hid node under the USB device. This allows usb HID device
> > drivers to be described in firmware and make use of device properties.
> 
> Can this patch be applied already, so we don't drag it again and again?

done :)

Cheers,
Benjamin

