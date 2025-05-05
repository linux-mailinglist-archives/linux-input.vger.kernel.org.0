Return-Path: <linux-input+bounces-12148-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFCBAA94E1
	for <lists+linux-input@lfdr.de>; Mon,  5 May 2025 15:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9023F3BC7E1
	for <lists+linux-input@lfdr.de>; Mon,  5 May 2025 13:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C575259C92;
	Mon,  5 May 2025 13:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IIs8454j"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F062512F3;
	Mon,  5 May 2025 13:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746453157; cv=none; b=HubWTPNscMRQ0uaoSYfH6DBweWfdEP5+/9KNPrLJUPgA/qF4cPiwUoKaJCwq3NpB2CE6JcqtEwCDxRGY8DZktBwTktQZ43A6Wg3LaHO5O/+3cLeV/eKU5jkgjCGmocIsbRDnAmdDliKuspcQ26CJ5NBbXIJIBynvGgT2J1RYh1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746453157; c=relaxed/simple;
	bh=jN4v51iyAmUYxuKDoKi6umdrQGtpaXoL/1HLVvF5WH4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=O5YfI6QTakDQoBkH+juvAsHB0y1/g/dxq2Y1MFjhAmWDfAwARlqjkSN4Ar5FGoKb1zM0eyuFqU+XIi9SzCY3ixUDNQKV0gQMmH7L7R/ntHPrJKHWPYiUkNy0RR9iiwQ9czmZ2bborXDGtiBWjKMqgPL/KW7O1vFIxOcddcx++yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IIs8454j; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746453156; x=1777989156;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=jN4v51iyAmUYxuKDoKi6umdrQGtpaXoL/1HLVvF5WH4=;
  b=IIs8454j7Vyn6OhDC2g1i7wYxH+mvaBAsBbZvyFBz1UGtq+R5oHL64+z
   5bOXzVBOWD07bJzuB4oUvlaCKFRUZjx4yHo2qj9XoDlFohCIHv9K4pZ9C
   qybYoTKsYQoOwjYMEPQOQe6568jrm1XI3KanuKks1TmNH2gJXMxnJQpLu
   jXanMvKWOCOFG1S1y/o7adTbzZBZtrqitc/9N0WD/yWb3gEMCfcApY+64
   b28zFIQgQlhj2XYesX+v+1GW4uV8WqEfvtBbwd8OXEQ+/HohiueW3U4H5
   KIiMX0ZR8C1qfuXzRmOTG5aiqBXHbQTH5eAIZoLl3KgFSYPOC3Yo4lXKK
   Q==;
X-CSE-ConnectionGUID: H16R64UHTkyyZ6BxkupDRw==
X-CSE-MsgGUID: o0X5tLd+SMGmbsuYpfbtag==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="51868532"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="51868532"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 06:52:35 -0700
X-CSE-ConnectionGUID: HSwhe3XcTReJsOICXU2l0w==
X-CSE-MsgGUID: 97QaK8YUTme0YoHXedbJiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="140046237"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.68])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 06:52:32 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, bentiss@kernel.org, 
 Werner Sembach <wse@tuxedocomputers.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org
In-Reply-To: <20250425210043.342288-1-wse@tuxedocomputers.com>
References: <20250425210043.342288-1-wse@tuxedocomputers.com>
Subject: Re: [PATCH v9 0/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
Message-Id: <174645314692.23202.56309255974182976.b4-ty@linux.intel.com>
Date: Mon, 05 May 2025 16:52:26 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 25 Apr 2025 22:53:28 +0200, Werner Sembach wrote:

> Note that I'm away from my work PC for the next week so expect my next
> response the monday after.
> 
> v2: - Integrated Armins feedback and fixed kernel test robot warnings.
> v3: - Fixed borked subject line of v2.
> v4: - Remove unrequired WMI mutex.
>     - Move device checking from probe to init.
>     - Fix device checking working exactly reverse as it should.
>     - Fix null pointer dereference because,
>         hdev->driver_data != hdev->dev.driver_data.
> v5: - Move everything to subfolder nb04 in preparation for the eventual
>         upstreaming of other tuxedo-driver parts.
>     - Integrated Ilpos coding style feedback.
>     - Use dev_set/get_drvdata() based on Armins feedback.
> v6: - Integrated more of Ilpo coding style feedback from a different LKML
>         patch-thread (less files, local functions prefixed with a short
>         string).
> v7: - Integrated more of Ilpos feedback e.g.:
>         - Use cleanup.h
>         - replace some if cases with a pointer in driver_data
>         - coding style oversights
> v8: - Integrated more of Ilpos feedback
>     - Typo fix spotted by Alok
> v9: - Introduce lamp_rgbi_tuple_t to group some values
>     - Introduce LAMP_MULTI_UPDATE_REPORT_LAMP_COUNT_MAX to not manually set
>       a fixed number at multiple places
>     - Move lamp_multi_update_report initialization in
>       handle_lamp_range_update_report out of the loop again as a small
>       performance optimization as the unused entries do not actually be
>       zeroed (I mixed up the spec of this devices wmi interface and the HID
>       spec)
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO NB04 devices
      commit: d430124bac586f9d4302ebf6a3146635539325d1

--
 i.


