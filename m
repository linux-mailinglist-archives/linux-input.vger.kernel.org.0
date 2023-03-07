Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2BEA6AEF3B
	for <lists+linux-input@lfdr.de>; Tue,  7 Mar 2023 19:22:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232710AbjCGSWP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Mar 2023 13:22:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232680AbjCGSVt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Mar 2023 13:21:49 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C819B371A;
        Tue,  7 Mar 2023 10:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678212933; x=1709748933;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3cUq3VzFGeD6zxBEFbWPNBisBKGOSmxnMQTCtv3pjoU=;
  b=dqsG6ndpTPMFevNDiWIVS4layvJoaC5VrOW9bmN2wsIebeYOWhWa7p/0
   SH1qzlBrhUnwIT0DRTi4xopJqGablLPE5SGTVVo5orZMq1iN7lzUSxbOZ
   GplKRIQygqWl7rGQtSCO9XMHccgU9ewb+y6Ifp9yYi0uW/ibKFtjf3SCY
   43Pu75dfFeQwc3OOxfLnfXKTw95g9WF2Uk0pfUM+nFuxks5+Z0kD3CCrS
   NOWumTQLX8lAfcSsnNo8JjSgRWhWuGfrPY6UWFAKnKcfhjBska/q7y3a2
   BrZRuX3CigpSRcYjiQX7RxNqOZdcpBnCulB5jh1SqJBgHsA9YJqQkDvFJ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="315588285"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="315588285"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 10:15:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="670009979"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="670009979"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 07 Mar 2023 10:15:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pZbqQ-00H3DB-0Y;
        Tue, 07 Mar 2023 20:15:26 +0200
Date:   Tue, 7 Mar 2023 20:15:25 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Kaehn <kaehndan@gmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v8 3/3] HID: cp2112: Fwnode Support
Message-ID: <ZAd/PauhOk85SuDv@smile.fi.intel.com>
References: <20230302170554.q3426ii255735rzw@mail.corp.redhat.com>
 <ZAXFNRuALYpXgL6F@smile.fi.intel.com>
 <b8423b0b-4f63-d598-6c8b-7c7e73549032@redhat.com>
 <ZAXlh9ZVjGJh0l7n@smile.fi.intel.com>
 <1cab1439-77f3-6739-d4cd-5862ce8512d8@redhat.com>
 <ZAYca0ADk0Uk1sK1@smile.fi.intel.com>
 <CAP+ZCCfsKdOyy5vzPh5OjpZjNQrYWDRzrqa_QxvG+kZDPYa+3A@mail.gmail.com>
 <ZAZOvEvqNDq6jZNB@smile.fi.intel.com>
 <20230307131706.olnb4qzo4ynu7gce@mail.corp.redhat.com>
 <CAP+ZCCcbXqPOY5Xzq9v8JNSzH9+xOqgfkTezJdLQY=vwQco4vQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP+ZCCcbXqPOY5Xzq9v8JNSzH9+xOqgfkTezJdLQY=vwQco4vQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 07, 2023 at 07:53:20AM -0600, Daniel Kaehn wrote:
> On Tue, Mar 7, 2023 at 7:17 AM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:

...

> More and more, after actually seeing and working with ACPI, I suspect that
> you both are right. Maybe (hopefully) though, there is some unified way that can
> be made to do this, so that individual drivers won't have to directly code for /
> be aware of the differences in the firmware languages (at least, that seemed
> to be the intent of the fw_node/device api in the first place). Maybe a
> `device_get_child_by_name_or_index` (terribly long name) sort of function
> might fill in that gap?

Look also at the solution I proposed in response to Benjamin in my previous
email.

-- 
With Best Regards,
Andy Shevchenko


