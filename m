Return-Path: <linux-input+bounces-4144-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 873BA8FDACD
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 01:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E9D61C22BF4
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 23:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D697167D83;
	Wed,  5 Jun 2024 23:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JyV8OtzV"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB417167268;
	Wed,  5 Jun 2024 23:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717631016; cv=none; b=FRglhpm0LCNxmRNWWgXrvBSxeTU7j75n0liCs0BeGNyq8CQPX4P+drdh4QV3x8zy8FxnmrlEOEFAmX0sJjSzmGTSH1QeUAf9ECJjyWxxgdseoD5kFumndPOTQBe+RSEZhD9HteBR2LtC2K72eGabfqfEp2hJy+5uGFd0VsuP+oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717631016; c=relaxed/simple;
	bh=0ud6l2igzijZx0fQ1jd+W6Ev3SzXM4c1ja8Gr1TgFA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Il7oyemehmnFhDgT6lfsPimNKv3x/1/KYR4rzJ3tRaxRRS8gBrmD4dfnPy3AG1IvIDRfGvSNl6Srk/NxR0UxNeeK8MhcJ+4XTbeM64nnPQoCuvVGMSKlnmBTBZ+BawF16dUoWG9r6DpYqvau2sNfuHcuyDrhN/6fgoBbDGDnMR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JyV8OtzV; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717631015; x=1749167015;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0ud6l2igzijZx0fQ1jd+W6Ev3SzXM4c1ja8Gr1TgFA0=;
  b=JyV8OtzVO/0vIrnVrfSH9TB/b+gK3c/mHfoE1E+7Io1QZGnARgF6x3hV
   /EntjNdH1cH9Y43fyAt3N/IrocDbqYQCpfV9BMUXEJ0bQftxlf2tc2wKS
   ES7LeLjS64oyedqd9vAs3yXBl69lJscGL1vV5mB4RtR+PKnLssZEaE7jB
   5rWg29lyzRm1jY79pYJ3tna9N3WJWQQU91n3huQERC0je0NfDQ2eSlkwP
   aAY4+iJuJ6vUUoYfqHkCjSN8sP1aTvCA53SvNJc27q9ePoIjEijQc4Kh7
   OJanva6AlhOVy7B5M94zjSv2BQ5yRNCKPjEdS/ffgoY5nVHfKFzDmMxwh
   A==;
X-CSE-ConnectionGUID: vMYxptj5TMiY26gkPl+XOA==
X-CSE-MsgGUID: V9ITPsM6ToaTI1E1hE9DiQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14228835"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="14228835"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 16:43:34 -0700
X-CSE-ConnectionGUID: Fpw+NY5LSYuGMklnF0P44Q==
X-CSE-MsgGUID: K0nD0fU7SkOXNfmYfWlfJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="68907948"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 16:43:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sF0Hx-0000000E06p-0Ci9;
	Thu, 06 Jun 2024 02:43:29 +0300
Date: Thu, 6 Jun 2024 02:43:28 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Danny Kaehn <danny.kaehn@plexus.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jiri Kosina <jikos@kernel.org>, devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Ethan Twardy <ethan.twardy@plexus.com>
Subject: Re: [PATCH v11 2/4] HID: usbhid: Share USB device firmware node with
 child HID device
Message-ID: <ZmD4IFFHmUkDtUeL@smile.fi.intel.com>
References: <20240605-cp2112-dt-v11-0-d55f0f945a62@plexus.com>
 <20240605-cp2112-dt-v11-2-d55f0f945a62@plexus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605-cp2112-dt-v11-2-d55f0f945a62@plexus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jun 05, 2024 at 06:12:45PM -0500, Danny Kaehn wrote:
> USB HID core now shares its fwnode with its child HID device.
> Since there can only be one HID device on a USB interface, it is redundant
> to specify a hid node under the USB device. This allows usb HID device
> drivers to be described in firmware and make use of device properties.

Can this patch be applied already, so we don't drag it again and again?

-- 
With Best Regards,
Andy Shevchenko



