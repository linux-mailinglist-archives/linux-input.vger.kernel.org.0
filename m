Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7E16B0ED7
	for <lists+linux-input@lfdr.de>; Wed,  8 Mar 2023 17:36:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbjCHQgS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Mar 2023 11:36:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjCHQgR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Mar 2023 11:36:17 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657B3C48B3;
        Wed,  8 Mar 2023 08:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678293376; x=1709829376;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=s9BtKtVSrIKLXagJLYzRz116xejwMWGS1//KAH8CpD0=;
  b=PDQ+yMAnyWXG9gB8sp2i86N79yVwv5sGg+ga4Nuip/kLm44Q7tqamcwg
   JSy8OoRIpHQkrdJWtjqt+yrBhm5pImrxwMu8OLKhA+73ymULMS51Lplgd
   E42d7QG1vF8l38RLvkDMfv03zqB0xWPDxSL5DnNHvhN7MNeUqQhl2ffNc
   oY7VUxZnpEq2UQN7hxCWe58INDKwVJFVCv2Idb8mG3njs9s3vtT8IBFIC
   4pGfF/39bQk5PoIMZdsb/JEZO19SHj+/RzFtiTzU0HuHJckex4OF6v+dG
   xUqeY/FjLvlMzJ+kVraneea2k5ZkiZ15yzi09rVf2HwF/J8k1VOUzZlzC
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="320033353"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="320033353"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 08:36:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="1006385764"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="1006385764"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 08 Mar 2023 08:36:12 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pZwlv-00HVvn-03;
        Wed, 08 Mar 2023 18:36:11 +0200
Date:   Wed, 8 Mar 2023 18:36:10 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Daniel Kaehn <kaehndan@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v8 3/3] HID: cp2112: Fwnode Support
Message-ID: <ZAi5esmc158Bd2oL@smile.fi.intel.com>
References: <CAP+ZCCfsKdOyy5vzPh5OjpZjNQrYWDRzrqa_QxvG+kZDPYa+3A@mail.gmail.com>
 <ZAZOvEvqNDq6jZNB@smile.fi.intel.com>
 <20230307131706.olnb4qzo4ynu7gce@mail.corp.redhat.com>
 <CAP+ZCCcbXqPOY5Xzq9v8JNSzH9+xOqgfkTezJdLQY=vwQco4vQ@mail.gmail.com>
 <20230307144852.ueyaotkeeqfjlgk7@mail.corp.redhat.com>
 <ZAeADcJWmJR+1ycJ@smile.fi.intel.com>
 <20230308152611.tae2pnmflakrcyhh@mail.corp.redhat.com>
 <CAP+ZCCcntCn4yaVKtTxDuDRvPgLXfP1kC7mYe2qKuhSGzVZMog@mail.gmail.com>
 <20230308155527.jnrsowubvnk22ica@mail.corp.redhat.com>
 <ZAi4NjqXTbLpVhPo@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZAi4NjqXTbLpVhPo@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Mar 08, 2023 at 06:30:46PM +0200, Andy Shevchenko wrote:
> On Wed, Mar 08, 2023 at 04:55:27PM +0100, Benjamin Tissoires wrote:
> > On Mar 08 2023, Daniel Kaehn wrote:
> > > On Wed, Mar 8, 2023 at 9:26 AM Benjamin Tissoires
> > > <benjamin.tissoires@redhat.com> wrote:

...

> > 			ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
> > 			Package () {
> > 				Package () { "cell-names", Package () { "i2c", "gpio" }
> > 			}
> 
> Yeah, looking at this, I think it still fragile. First of all, either this is
> missing, or simply wrong. We would need to access indices. ACPI _ADR is in the
> specification. As much as with PCI it may be considered reliable.
> 
> So, that said, forget about it, and simply use _ADR as indicator of the node.
> See how MFD (in the Linux kernel) cares about this. Ex. Diolan DLN-2 driver.

And that said, maybe CP2112 should simply re-use what MFD _already_ provides?

-- 
With Best Regards,
Andy Shevchenko


