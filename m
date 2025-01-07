Return-Path: <linux-input+bounces-9003-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCDBA04951
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 19:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC84B7A2A77
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 18:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E07081EE7DC;
	Tue,  7 Jan 2025 18:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJPPjRWE"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A27D190052;
	Tue,  7 Jan 2025 18:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736274974; cv=none; b=RZQLsFr8aNMn2RD06SUqBtvgjW7RIEsznJceujTaKSTPOzcbxJluTowvmo3NpuxkQrpBpDzPRgZJUR18rro+yrub3HaE6Ohl6IreF9zkbOUg7V4r2jHHAg1gvcgk0cHKcIc8gdJGKSiGAcVM42O0DaoS9crafSrgNo1G017RCC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736274974; c=relaxed/simple;
	bh=kaXuoj05E8SuerU+hFvFzHbkafiU7dYyDu0rAJpepM4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Zw7we1mSXK9MdSwcdBZM0KQRuP4wACgKwMBYa99t5FEt9Fevg4csyQqfcH0DYMCEwyGMBvrwogkAg6+MyI6/DNPDvKrNVdi2xurop17cwcQLYQTqrR9IVG6d1OKSWRNaBjhg58eV/OkP8Mpns49MrqBjNNS6NTlAQFWFyWhOCUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJPPjRWE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736274973; x=1767810973;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=kaXuoj05E8SuerU+hFvFzHbkafiU7dYyDu0rAJpepM4=;
  b=aJPPjRWEisjJdN8O6eaWcDby2oEzPJ36BEfDjgdX8WB0/g7OZieqzJUn
   A8aqIDEZ3LN9E5uuMMEDqqP9kUcvySvtCUCbJ4+ToWCx4D8a1l6FbRmLn
   BG2gBwlFDcUCfTONwl52cbNFG94JMsSBXADC7AOEFfP4a3nOjt7j0ouCx
   VzR979vTDXxDQ/0Iuio9TwYcaVfsaXlWOEejgIi5WWQmZR6UcTVkUmj5e
   kx6s2FaHYDG4uaKexxYaKSIc3jIEU7w90catG/dYnlCCzghLwQnTt30PT
   Nxj+ZCPVz069xcTJyzcCye+uEMzOtS/ows2BEoGWPNVARp2k8XtqySsdm
   g==;
X-CSE-ConnectionGUID: /ZTJni25T/qjxQt1cKTcUA==
X-CSE-MsgGUID: UG3PMjDKQkirrdx3DSntmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47890658"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="47890658"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 10:36:13 -0800
X-CSE-ConnectionGUID: 9oCioIpLSkexHHc1ZHZOQQ==
X-CSE-MsgGUID: hZ+A0RlBRfKYlNmPuR/CwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103703986"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.206])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 10:36:09 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Basavaraj Natikar <basavaraj.natikar@amd.com>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Akshata MukundShetty <akshata.mukundshetty@amd.com>, 
 Patil Rajesh Reddy <patreddy@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
In-Reply-To: <20241217151627.757477-1-Shyam-sundar.S-k@amd.com>
References: <20241217151627.757477-1-Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v2 0/2] Add new capabilities to PMF Smart PC
Message-Id: <173627496387.9568.15108205701803878170.b4-ty@linux.intel.com>
Date: Tue, 07 Jan 2025 20:36:03 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 17 Dec 2024 20:46:25 +0530, Shyam Sundar S K wrote:

> This series introduces the following enhancements:
> 
> - Support for device operating states in the AMD SFH driver through the
> SRA sensor.
> - Functionality in the PMF driver to export SRA data from the SFH driver
> to the PMF, allowing it to be used as input for the PMF-TA in evaluating
> policy conditions that involve SRA sensor data.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] HID: amd_sfh: Add support to export device operating states
      commit: c90bfa1d2999c9287155dfdfc659bb97be0127de
[2/2] platform/x86/amd/pmf: Get SRA sensor data from AMD SFH driver
      commit: fb2d09458ba813892c60bc0318bbbc9149d3c8d9

--
 i.


