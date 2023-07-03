Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40D0C745AA7
	for <lists+linux-input@lfdr.de>; Mon,  3 Jul 2023 12:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjGCK53 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Jul 2023 06:57:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjGCK52 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 3 Jul 2023 06:57:28 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF756C9;
        Mon,  3 Jul 2023 03:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688381847; x=1719917847;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=X3VlH9K19OuBvGHPMftKnphxNQLYWxQLKZwmAPD0saM=;
  b=dw8LlaqPnkWl3QsR5igME/DBUlW7kDSdpjy/IHqGbrUnV+A0Wc00uMHT
   vK8Uh8Xud5cNtgkOarFvadkmHeS8UYo3I1eeKD7e6+OG1kJFhhBj86XgU
   7B8f7qoR7mlVV7YTvcwrtZ4QjfdgIoShWLwoGrJtaBlP6PlI8my7IZOZj
   WiDnayyVuXhU7NGSeDEX2MGr4xu2GX9eA4EBPRPOC7PkvqOHt85iLwSHc
   jS8BRDmRETrTaBv6Pf0X0c0Je5M6ezTMaHwAfy3vMX80liu0CTZEI3phV
   zmMtbj4/xN4TmkIdM85+WU2pNZF0/N2eiXHFy3Z4wixrGPS+v8TvEEQxz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="449226270"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="449226270"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 03:57:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="1049035279"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="1049035279"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 03 Jul 2023 03:57:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qGHFC-001qGe-2Q;
        Mon, 03 Jul 2023 13:57:22 +0300
Date:   Mon, 3 Jul 2023 13:57:22 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Kaehn <kaehndan@gmail.com>,
        Niyas Sait <niyas.sait@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v9 3/3] HID: cp2112: Fwnode Support
Message-ID: <ZKKpknBH3Pa9mLS1@smile.fi.intel.com>
References: <20230319204802.1364-1-kaehndan@gmail.com>
 <20230319204802.1364-4-kaehndan@gmail.com>
 <ZBhYXwjPeRiZwxMT@smile.fi.intel.com>
 <ZBhY5Gp88gVK7q/g@smile.fi.intel.com>
 <CAP+ZCCc=q_=d18UHEZ9N8HVQ6AYQsTfNgS1r93UCJOB-OEodSw@mail.gmail.com>
 <ZBhoHzTr5l38u/kX@smile.fi.intel.com>
 <CAP+ZCCe3G_b3o=zWcqJNSFbs26yH6wzBbfHjkg2JuPeWgujfiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP+ZCCe3G_b3o=zWcqJNSFbs26yH6wzBbfHjkg2JuPeWgujfiQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

+Cc: Niyas, who is working a lot on filling the gaps in ACPI in comparison
     to DT in the Linux kernel. Perhaps he has some ideas or even better
     solutions.

On Mon, May 01, 2023 at 06:35:44PM -0500, Daniel Kaehn wrote:
> On Mon, Mar 20, 2023 at 9:10 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Mar 20, 2023 at 08:40:07AM -0500, Daniel Kaehn wrote:
> > > On Mon, Mar 20, 2023 at 8:00 AM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Mon, Mar 20, 2023 at 02:58:07PM +0200, Andy Shevchenko wrote:
> > > > > On Sun, Mar 19, 2023 at 03:48:02PM -0500, Danny Kaehn wrote:

...

> > > > > > +   device_for_each_child_node(&hdev->dev, child) {
> > > > > > +           name = fwnode_get_name(child);
> > > > > > +           ret = acpi_get_local_address(ACPI_HANDLE_FWNODE(child), &addr);
> > > > > > +
> > > > > > +           if ((name && strcmp("i2c", name) == 0) || (!ret && addr == 0))
> > > > > > +                   device_set_node(&dev->adap.dev, child);
> > > > > > +           else if ((name && strcmp("gpio", name)) == 0 ||
> > > > > > +                                   (!ret && addr == 1))
> > > > > > +                   dev->gc.fwnode = child;
> > > > > > +   }
> > > > >
> > > > > Please, make addresses defined explicitly. You may also do it with node naming
> > > > > schema:
> > > > >
> > > > > #define CP2112_I2C_ADR                0
> > > > > #define CP2112_GPIO_ADR               1
> > > > >
> > > > > static const char * const cp2112_cell_names[] = {
> > > > >       [CP2112_I2C_ADR]        = "i2c",
> > > > >       [CP2112_GPIO_ADR]       = "gpio",
> > > > > };
> > > > >
> > > > >       device_for_each_child_node(&hdev->dev, child) {
> > > > >               name = fwnode_get_name(child);
> > > > >               if (name) {
> > > > >                       ret = match_string(cp2112_cell_names, ARRAY_SIZE(cp2112_cell_names), name);
> > > > >                       if (ret >= 0)
> > > > >                               addr = ret;
> > > > >               } else
> > > > >                       ret = acpi_get_local_address(ACPI_HANDLE_FWNODE(child), &addr);
> > > > >               if (ret < 0)
> > > > >                       ...error handling if needed...
> > > > >
> > > > >               switch (addr) {
> > > > >               case CP2112_I2C_ADR:
> > > > >                       device_set_node(&dev->adap.dev, child);
> > > > >                       break;
> > > > >               case CP2112_GPIO_ADR:
> > > > >                       dev->gc.fwnode = child;
> > > > >                       break;
> > > > >               default:
> > > > >                       ...error handling...
> > > > >               }
> > > > >       }
> > > >
> > > > Btw, don't you use "reg" property for the child nodes? It would be better from
> > > > de facto used patterns (we have a couple of mode drivers that have a common
> > > > code to read "reg" or _ADR() and that code can be split into a helper and used
> > > > here).
> > >
> > > Named nodes _seem_ to be preferred in DT for when there isn't a logical /
> > > natural numbering to the child nodes. A.e. for USB, reg is used to specify
> > > which port, for I2C, which address on the bus, but for two parallel and
> > > independent functions on the same device, it seems named nodes would make
> > > more sense in DT. Many examples exist in mainline where named nodes are used
> > > in DT in this way.
> >
> > Okay, I'm not an expert in the DT preferable schemas, so I believe DT people
> > should answer on this.
> 
> Hello,
> 
> Thanks for all the time spent reviewing this thus far. Following up to
> see what my next steps might be.
> 
> It sounds like we might want some DT folks to weigh in on the strategy
> used for identifying the child I2C and GPIO nodes for the CP2112
> device before moving further toward applying this.
> 
> Since the DT list is on this thread (as well as Rob+Krzystof), and
> this has sat for a little while, I'm assuming that the ball is in my
> court to seek out an answer/opinion here. (I know folks get a lot of
> email, so apologies if the correct move would have been to wait a bit
> longer before following up! Not intending to be rude.)
> 
> Would it be appropriate / expected that I send a separate email thread
> to the DT mailing list on their opinion here? Or would that create
> more confusion/complexity in adding yet another thread? I did create a
> separate email thread for the initial DT vs. ACPI conversation we had
> about accessing children by name or index in a unified way due to the
> differences in upper/lower case and use-cases, but that
> (understandably) didn't seem to gain any traction.
> 
> Thanks for any insights!
> 
> Thanks,
> Danny Kaehn
> 
> > > One example is network cards which provide an mdio bus
> > > bind through the child "mdio". One example of a specifically a
> > > child i2c controller being bound to "i2c" can be found in
> > > pine64,pinephone-keyboard.yaml.
> > > But it's certainly possible this isn't the desired direction moving forward
> > > in DT -- my opinion should definitely be taken with a grain of salt. Maybe
> > > this is something I should follow up on with DT folks on that DT vs. ACPI
> > > thread made earlier.
> > >
> > > One thing I did notice when looking at the mfd subsystem is that most DT
> > > drivers actually match on the compatible string of the child nodes, a.e.
> > > "silabs,cp2112", "silabs,cp2112-gpio".  "silabs,cp2112-i2c". We could
> > > implement that here, but I think that would make more sense if we were to
> > > actually split the cp2112 into mfd & platform drivers, and additionally split
> > > the DT binding by function.
> >
> > IIRC (but might be very well mistaken) the compatible strings for children
> > are discouraged.

-- 
With Best Regards,
Andy Shevchenko


