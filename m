Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B077E6A1FDF
	for <lists+linux-input@lfdr.de>; Fri, 24 Feb 2023 17:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbjBXQnh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Feb 2023 11:43:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbjBXQnh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Feb 2023 11:43:37 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53F4A1A961;
        Fri, 24 Feb 2023 08:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677257016; x=1708793016;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jJ+zDYe8YpOn9npwy/AmG2yBFLE8F2/8quZbClKmzyQ=;
  b=M0LbihbSthwe0MvHlso/2AV9S1PxsbZgJTlKgB5hYVO823AhX36R8N0N
   794AuJwGJw2jeeJQM+qj6sg+m62N7voWLfS+wNY0tgMozY0K3Ka2rdmUc
   Vnlnu96ivbqSQbAS2baVM/hMCVJhRn+pkIYhGPJXCNNF0k6qmddvUm3QH
   DPJl784hXLBJT2RMiFyFBCdnAox2GihQdxpI8OXsfBiCCV4jphe6QlPF3
   A9fkY4qGcyrjBXks2J/gJgyYPkEv6uMM2FAUdt/MUQL0WHYH00F/Cg/+q
   g/mrGY+E/XQOcOMzEWnXC5xEsVbpO9tYJQDsLzvR3ue1Vdwy+AnQ1H67l
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="331252001"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="331252001"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 08:43:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="672955234"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="672955234"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 24 Feb 2023 08:43:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pVbAP-00BXMW-0q;
        Fri, 24 Feb 2023 18:43:29 +0200
Date:   Fri, 24 Feb 2023 18:43:28 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Danny Kaehn <kaehndan@gmail.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v7 0/3] Firmware Support for USB-HID Devices and CP2112
Message-ID: <Y/jpME2mb5CqPooj@smile.fi.intel.com>
References: <20230223213147.268-1-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223213147.268-1-kaehndan@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Feb 23, 2023 at 03:31:44PM -0600, Danny Kaehn wrote:
> This patchset allows USB-HID devices to have DeviceTree bindings through sharing
> the USB fwnode with the HID driver, and adds such a binding and driver
> implementation for the CP2112 USB to SMBus Bridge (which necessitated the
> USB-HID change). This change allows a CP2112 permanently attached in hardware to
> be described in DT and interoperate with other drivers.

It's your responsibility to carry the tags you have got in the previous rounds
of the review. Please, be respectful to the reviewers who spent a lot of time
on yours, in particular, code. Otherwise why to bother with it (upstreaming)
at all?

-- 
With Best Regards,
Andy Shevchenko


