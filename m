Return-Path: <linux-input+bounces-12147-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A23AA94DE
	for <lists+linux-input@lfdr.de>; Mon,  5 May 2025 15:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC6E83BC19E
	for <lists+linux-input@lfdr.de>; Mon,  5 May 2025 13:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6583259C87;
	Mon,  5 May 2025 13:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJRSlhDS"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC122512F3;
	Mon,  5 May 2025 13:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746453148; cv=none; b=fZoL9FBRnY22tWbCnuKU8SDnm4l2pPLEvvR/ddjGNsrxVv2KXAxfMbt0YGdeOc/vHEoQypTxPxNP2Sem6nfHdrR6yw8Ttk9XC6u4h62d/f9z6V7SscfmCmNgDEruHrRShTodpUJ3cmIF2eLUyjdGKeP6lOTdGCWKhEce094QeiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746453148; c=relaxed/simple;
	bh=g8x+0u80yRs11NJgYFA7XL29+CPcvdp2ybha6SrbuZY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Gfjq9hXaE7QDeWfTnkrkKGrU8Wx8EBeSxIMAUHR3xRAUVtnXPzc8HdJ+qX51XOPF8TM9QySA5+CZHO8OXgufYCP0nCeBDjc3w05M0z6aDrLe4e7LUl2OxIlDig8mLHgocukNalfya2BtSq9zvuSAnUtUXyHQQh01O+MYAYsHMX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJRSlhDS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746453147; x=1777989147;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=g8x+0u80yRs11NJgYFA7XL29+CPcvdp2ybha6SrbuZY=;
  b=JJRSlhDSFUWA1zd3yAWDnIBgLlhk7fpifBTN5gMHKtgFrqB8CCrA8mEF
   47sU5ZAZzUu/0WGcvlGZGlbABJdPNSu7p12WEBz6+9JqmUlg7UuIDPTMd
   eZ7Z7WelD1zS2sncV8QvZ+jfQKANVsa92+q82RsiJrhEXIgcaTjWWznbE
   /LAZuHHGE58AMNl1QW2JrFGNKa6oby87EqflstJI45w8wDzdmsOJFAd88
   chIFriDBzUEbk3QfL6a/ULmSR9f8a0avH3HVP+JlNqhKdrqUpdQJwbVa1
   hLV8u7y0RShMKKaYz54wkACTAMoAqdt26TS4gbHh4qCeSnjxDMLbrsdOF
   g==;
X-CSE-ConnectionGUID: SwYY2080QNSSQ5+6+x83GQ==
X-CSE-MsgGUID: gSyl2FlBS66zwXuH2Twsnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="51868501"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="51868501"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 06:52:27 -0700
X-CSE-ConnectionGUID: tYPQN2fiTqG1+ugNgQKDmQ==
X-CSE-MsgGUID: CK1lbgu1QPKNHAYRoB/whw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="140046216"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.68])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 06:52:23 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, Luke Jones <luke@ljones.dev>
Cc: hdegoede@redhat.com, platform-driver-x86@vger.kernel.org, 
 linux-input@vger.kernel.org, bentiss@kernel.org, jikos@kernel.org, 
 mario.limonciello@amd.com, lkml@antheas.dev
In-Reply-To: <20250323023421.78012-1-luke@ljones.dev>
References: <20250323023421.78012-1-luke@ljones.dev>
Subject: Re: [PATCH v4 0/2] hid-asus: asus-wmi: refactor Ally
 suspend/resume
Message-Id: <174645313917.23202.9513224587280023124.b4-ty@linux.intel.com>
Date: Mon, 05 May 2025 16:52:19 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sun, 23 Mar 2025 15:34:19 +1300, Luke Jones wrote:

> This short series refactors the Ally suspend/resume functionality in the
> asus-wmi driver along with adding support for ROG Ally MCU version checking.
> 
> The version checking is then used to toggle the use of older CSEE call hacks
> that were initially used to combat Ally suspend/wake issues arising from the MCU
> not clearing a particular flag on resume. ASUS have since corrected this
> especially for Linux in newer firmware versions.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] hid-asus: check ROG Ally MCU version and warn
      commit: 6b4585948d1ed226f194195180be09fa24b760ec
[2/2] platform/x86: asus-wmi: Refactor Ally suspend/resume
      commit: c26e7d5d2d89af198b43e4c57b1aff5289f65450

--
 i.


