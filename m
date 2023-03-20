Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00A2F6C146A
	for <lists+linux-input@lfdr.de>; Mon, 20 Mar 2023 15:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbjCTOKp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Mar 2023 10:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbjCTOKn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Mar 2023 10:10:43 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4CE810AB0;
        Mon, 20 Mar 2023 07:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679321441; x=1710857441;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=lE1DIZvdTN/JZ2Aqr7k5UOK8wRZRTjDFOgLlJyvZ29Q=;
  b=bRVo6wMznPPvQ5oPmZT78uObyH65jBA3xDJZoqnh1jVYwbrwM96Z5qz7
   Zz0XDSv39ngvASAEwzsKOXhLY0L2dYA/DwL6ynjuQtEPGOs7vdcJiQ3i+
   wGQCyRL/Tuye5xssA1ntUuv2DSE4WP7j9Si2+H3ulK8PDzhGXlEsUnvnJ
   LmgVfJ+wcD1b1eqMHjam5rrGt9Fcdj+RJnm1m3FxNxZw63fjQKLZHtkCT
   /Etui1WieUt/RGjk6/m4bN+12Cabx6gyzvbJyAH85QPaqXxQO5568YtHO
   /Ak4pUIdXiO/h16v5liETx3W8VdN/4qBkI8T8w1Xzqm1Oo6hX6rsnsVKw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="366388378"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="366388378"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 07:05:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="681074935"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="681074935"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 20 Mar 2023 07:05:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1peG8V-006IuJ-1g;
        Mon, 20 Mar 2023 16:05:19 +0200
Date:   Mon, 20 Mar 2023 16:05:19 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Kaehn <kaehndan@gmail.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v9 3/3] HID: cp2112: Fwnode Support
Message-ID: <ZBhoHzTr5l38u/kX@smile.fi.intel.com>
References: <20230319204802.1364-1-kaehndan@gmail.com>
 <20230319204802.1364-4-kaehndan@gmail.com>
 <ZBhYXwjPeRiZwxMT@smile.fi.intel.com>
 <ZBhY5Gp88gVK7q/g@smile.fi.intel.com>
 <CAP+ZCCc=q_=d18UHEZ9N8HVQ6AYQsTfNgS1r93UCJOB-OEodSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP+ZCCc=q_=d18UHEZ9N8HVQ6AYQsTfNgS1r93UCJOB-OEodSw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_FILL_THIS_FORM_SHORT autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 20, 2023 at 08:40:07AM -0500, Daniel Kaehn wrote:
> On Mon, Mar 20, 2023 at 8:00 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Mar 20, 2023 at 02:58:07PM +0200, Andy Shevchenko wrote:
> > > On Sun, Mar 19, 2023 at 03:48:02PM -0500, Danny Kaehn wrote:

...

> > > > +   device_for_each_child_node(&hdev->dev, child) {
> > > > +           name = fwnode_get_name(child);
> > > > +           ret = acpi_get_local_address(ACPI_HANDLE_FWNODE(child), &addr);
> > > > +
> > > > +           if ((name && strcmp("i2c", name) == 0) || (!ret && addr == 0))
> > > > +                   device_set_node(&dev->adap.dev, child);
> > > > +           else if ((name && strcmp("gpio", name)) == 0 ||
> > > > +                                   (!ret && addr == 1))
> > > > +                   dev->gc.fwnode = child;
> > > > +   }
> > >
> > > Please, make addresses defined explicitly. You may also do it with node naming
> > > schema:
> > >
> > > #define CP2112_I2C_ADR                0
> > > #define CP2112_GPIO_ADR               1
> > >
> > > static const char * const cp2112_cell_names[] = {
> > >       [CP2112_I2C_ADR]        = "i2c",
> > >       [CP2112_GPIO_ADR]       = "gpio",
> > > };
> > >
> > >       device_for_each_child_node(&hdev->dev, child) {
> > >               name = fwnode_get_name(child);
> > >               if (name) {
> > >                       ret = match_string(cp2112_cell_names, ARRAY_SIZE(cp2112_cell_names), name);
> > >                       if (ret >= 0)
> > >                               addr = ret;
> > >               } else
> > >                       ret = acpi_get_local_address(ACPI_HANDLE_FWNODE(child), &addr);
> > >               if (ret < 0)
> > >                       ...error handling if needed...
> > >
> > >               switch (addr) {
> > >               case CP2112_I2C_ADR:
> > >                       device_set_node(&dev->adap.dev, child);
> > >                       break;
> > >               case CP2112_GPIO_ADR:
> > >                       dev->gc.fwnode = child;
> > >                       break;
> > >               default:
> > >                       ...error handling...
> > >               }
> > >       }
> >
> > Btw, don't you use "reg" property for the child nodes? It would be better from
> > de facto used patterns (we have a couple of mode drivers that have a common
> > code to read "reg" or _ADR() and that code can be split into a helper and used
> > here).
> >
> 
> Named nodes _seem_ to be preferred in DT for when there isn't a logical /
> natural numbering to the child nodes. A.e. for USB, reg is used to specify
> which port, for I2C, which address on the bus, but for two parallel and
> independent functions on the same device, it seems named nodes would make
> more sense in DT. Many examples exist in mainline where named nodes are used
> in DT in this way.

Okay, I'm not an expert in the DT preferable schemas, so I believe DT people
should answer on this.

> One example is network cards which provide an mdio bus
> bind through the child "mdio". One example of a specifically a
> child i2c controller being bound to "i2c" can be found in
> pine64,pinephone-keyboard.yaml.
> But it's certainly possible this isn't the desired direction moving forward
> in DT -- my opinion should definitely be taken with a grain of salt. Maybe
> this is something I should follow up on with DT folks on that DT vs. ACPI
> thread made earlier.
> 
> One thing I did notice when looking at the mfd subsystem is that most DT
> drivers actually match on the compatible string of the child nodes, a.e.
> "silabs,cp2112", "silabs,cp2112-gpio".  "silabs,cp2112-i2c". We could
> implement that here, but I think that would make more sense if we were to
> actually split the cp2112 into mfd & platform drivers, and additionally split
> the DT binding by function.

IIRC (but might be very well mistaken) the compatible strings for children
are discouraged.

-- 
With Best Regards,
Andy Shevchenko


