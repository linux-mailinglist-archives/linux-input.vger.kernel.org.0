Return-Path: <linux-input+bounces-1305-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A76DE83153C
	for <lists+linux-input@lfdr.de>; Thu, 18 Jan 2024 09:58:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 201801F25209
	for <lists+linux-input@lfdr.de>; Thu, 18 Jan 2024 08:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A179D11CBA;
	Thu, 18 Jan 2024 08:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KnzIdAky"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787B511716;
	Thu, 18 Jan 2024 08:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705568314; cv=none; b=go8baj64niBGOqLpePMmpCIVxpLcCxe2qOKkJDO1kDGsprjK090kyJd+wfuJe8yh9k8il47o0dge8vBvb4LiAqNNwh5P8uWMfCvwaGjuSERZzUs1h1f0ZHEkFhbDmLOxIBQwgQ3SSl1G9UnzMu4zfpKrDd+gfr/FthWnuiESQF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705568314; c=relaxed/simple;
	bh=tltqNMR1vAR35HJxfe6PiPNgZLxEpjVCsuMPCFeHMYY=;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To; b=QV2xh3HYJVq6q+6DUrNzGa3S4KxlgX/nK+ZHZwmhLJIWFS4HcAG1nViwTvs1QrxSYykuZzmoodsd879XuryJTvlI/QZHjlXmT6uOb4gDxZSxlJdsSkyA57ZTFyCS2iQGSpdVeOHfqdx35MoidEdcoxdDIITQH4s1LMMA6iT0ung=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KnzIdAky; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23291C433C7;
	Thu, 18 Jan 2024 08:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705568314;
	bh=tltqNMR1vAR35HJxfe6PiPNgZLxEpjVCsuMPCFeHMYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KnzIdAky5RKcibl7CtS3dmuSNDBXt3lim7q+tb/Ut9lqCHuliU1tccwpxC/LMeRo1
	 2nWVkRPWrN8LUWkg7Yj7nyNP+vHLnwlMxVJdtV4EXzyXW4o1+LQH3nfZCqzM/QT0AE
	 1IKt60Megmx4XacPpY4qhHmV2BQFi0X3503lrndFM1SfVw3s6yq9I0Ns+279spSp/i
	 oBETl42aeOlnq1WgqpdMoaLjjpGGo8/mX+5Jfh/aYmZdeqNkJKyoATqKHG/faqicjC
	 Pt5F0Ml8OnpHPfTYCaqYU3sYNpDLFu3UHyJnrPD+L+xHJphspAQVv2ABITPBda4gDZ
	 UXLPvVlvQHcdQ==
Date: Thu, 18 Jan 2024 09:58:28 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Danny Kaehn <Danny.Kaehn@plexus.com>
Cc: 
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "kaehndan@gmail.com" <kaehndan@gmail.com>, 
	"bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>, "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>, 
	Ethan Twardy <Ethan.Twardy@plexus.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "jikos@kernel.org" <jikos@kernel.org>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "niyas.sait@linaro.org" <niyas.sait@linaro.org>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v9 3/3] HID: cp2112: Fwnode Support
Message-ID: <wbbvrbss2ezcjysrjhouagschuhcovyfwaybvbuttnsnojfniq@d2qkr7uz7owu>
References: <ZKKpknBH3Pa9mLS1@smile.fi.intel.com>
 <3e0fc6fa95f19d39711ca66808a2cff344652985.camel@plexus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e0fc6fa95f19d39711ca66808a2cff344652985.camel@plexus.com>

Hi Danny,

On Jan 17 2024, Danny Kaehn wrote:
> Hello folks, wanted to give one more follow up on this
> patch/discussion. Would a reasonable next step for me
> to help nudge this forward be to submit a v10 addressing
> Andy's most recent code comments? Again hoping I'm not being
> rude or stepping on toes; just want to make sure I'm doing my
> dilligence to move things forward. I'll assume that going ahead
> and submitting a v10 with unresolved discussion here isn't a
> terrible offense if I don't end up getting a response here in 
> the next week or so.

Submitting a v10, even if there are still undecided points is definitely
the way forward. People probably have forgot a lot of things there and
need a refresh on the latest state of it :)

> 
> Leaving some links to some of the more key points of the discussion
> across the versions of this patch, since it's been ~5 months since
> the last activity here.
> 
> Discussion began with discussion of using child nodes by name
> across DT with ACPI, for binding fwnodes for the CP2112's I2C
> and GPIO controllers; since  ACPI requires uppercase names (and
> names should specifically not be meaningful in ACPI)
> https://lore.kernel.org/all/Y%2F9oO1AE6GK6CQmp@smile.fi.intel.com/

I think the DT part is fine. Please resubmit it in v10, but probably
drop the previous rev-by and explicitly mention you did so after the
first '---' below your signed-off-by. This should re-trigger a review
from them. Things may have changed since last year, and having another
review would be beneficial IMO.

> 
> Andy suggested I use _ADR to identify the child node by index
> for ACPI
> https://lore.kernel.org/all/ZAi4NjqXTbLpVhPo@smile.fi.intel.com/

I think I still prefer the "_DSD" approach with the cell-names, but
OTOH, it's not like there is an official ACPI description for this, and
we can basically define whatever we want. So please go ahead with the
_ADR approach IMO, with a couple of changes:

- mention about that in the DT bindings documentation
- please add an enum with those 2 addresses (with kernel doc), to
  document it in the code and not have magic constants in your checks

> 
> v9 implemented matching by child node name OR by address depnding
> on the type of firmware used
> https://lore.kernel.org/all/20230319204802.1364-4-kaehndan@gmail.com/

See my 2 comments above.

FWIW, I think 2/3 could go directly in as well, but the timing is not
ideal, we are in the middle of the Merge Window.

> 
> Some additional discussion on whether matching child nodes by name
> is the best approach even for the DT side
> (also within the in-line body of this email)
> https://lore.kernel.org/all/ZBhoHzTr5l38u%2FkX@smile.fi.intel.com/

Honestly, not sure we'll have too many users on the ACPI side (besides
myself). So if you really feel uncomfortable, you can always put a
warning that we are using _ADR in the ACPI world as a fallback, but that
we might revisit that in the future (with naming, if we reach to an
agreement).

Cheers,
Benjamin

> 
> 
> The DT binding patch in question
> https://lore.kernel.org/all/20230319204802.1364-2-kaehndan@gmail.com/
> 
> Thanks,
> 
> Danny Kaehn
> 
> 
> 
> 
> On Mon, Jul 3 2023 at 13:57:22 +0300 Andy Shevchenko write:
> > On Mon, May 01, 2023 at 06:35:44PM -0500, Daniel Kaehn wrote:
> > > On Mon, Mar 20, 2023 at 9:10 AM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Mon, Mar 20, 2023 at 08:40:07AM -0500, Daniel Kaehn wrote:
> > > > > On Mon, Mar 20, 2023 at 8:00 AM Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > On Mon, Mar 20, 2023 at 02:58:07PM +0200, Andy Shevchenko
> Wrote:
> > > > > > > On Sun, Mar 19, 2023 at 03:48:02PM -0500, Danny Kaehn
> wrote:
> > +Cc: Niyas, who is working a lot on filling the gaps in ACPI in
> comparison
> >      to DT in the Linux kernel. Perhaps he has some ideas or even
> better
> >      solutions.
> > 
> > 
> > ...
> > 
> > > > > > > > +   device_for_each_child_node(&hdev->dev, child) {
> > > > > > > > +           name = fwnode_get_name(child);
> > > > > > > > +           ret =
> acpi_get_local_address(ACPI_HANDLE_FWNODE(child), &addr);
> > > > > > > > +
> > > > > > > > +           if ((name && strcmp("i2c", name) == 0) ||
> (!ret && addr == 0))
> > > > > > > > +                   device_set_node(&dev->adap.dev,
> child);
> > > > > > > > +           else if ((name && strcmp("gpio", name)) == 0
> ||
> > > > > > > > +                                   (!ret && addr == 1))
> > > > > > > > +                   dev->gc.fwnode = child;
> > > > > > > > +   }
> > > > > > >
> > > > > > > Please, make addresses defined explicitly. You may also do
> it with node naming
> > > > > > > schema:
> > > > > > >
> > > > > > > #define CP2112_I2C_ADR                0
> > > > > > > #define CP2112_GPIO_ADR               1
> > > > > > >
> > > > > > > static const char * const cp2112_cell_names[] = {
> > > > > > >       [CP2112_I2C_ADR]        = "i2c",
> > > > > > >       [CP2112_GPIO_ADR]       = "gpio",
> > > > > > > };
> > > > > > >
> > > > > > >       device_for_each_child_node(&hdev->dev, child) {
> > > > > > >               name = fwnode_get_name(child);
> > > > > > >               if (name) {
> > > > > > >                       ret = match_string(cp2112_cell_names,
> ARRAY_SIZE(cp2112_cell_names), name);
> > > > > > >                       if (ret >= 0)
> > > > > > >                               addr = ret;
> > > > > > >               } else
> > > > > > >                       ret =
> acpi_get_local_address(ACPI_HANDLE_FWNODE(child), &addr);
> > > > > > >               if (ret < 0)
> > > > > > >                       ...error handling if needed...
> > > > > > >
> > > > > > >               switch (addr) {
> > > > > > >               case CP2112_I2C_ADR:
> > > > > > >                       device_set_node(&dev->adap.dev,
> child);
> > > > > > >                       break;
> > > > > > >               case CP2112_GPIO_ADR:
> > > > > > >                       dev->gc.fwnode = child;
> > > > > > >                       break;
> > > > > > >               default:
> > > > > > >                       ...error handling...
> > > > > > >               }
> > > > > > >       }
> > > > > >
> > > > > > Btw, don't you use "reg" property for the child nodes? It
> would be better from
> > > > > > de facto used patterns (we have a couple of mode drivers that
> have a common
> > > > > > code to read "reg" or _ADR() and that code can be split into
> a helper and used
> > > > > > here).
> > > > >
> > > > > Named nodes _seem_ to be preferred in DT for when there isn't a
> logical /
> > > > > natural numbering to the child nodes. A.e. for USB, reg is used
> to specify
> > > > > which port, for I2C, which address on the bus, but for two
> parallel and
> > > > > independent functions on the same device, it seems named nodes
> would make
> > > > > more sense in DT. Many examples exist in mainline where named
> nodes are used
> > > > > in DT in this way.
> > > >
> > > > Okay, I'm not an expert in the DT preferable schemas, so I
> believe DT people
> > > > should answer on this.
> > > 
> > > Hello,
> > > 
> > > Thanks for all the time spent reviewing this thus far. Following up
> to
> > > see what my next steps might be.
> > > 
> > > It sounds like we might want some DT folks to weigh in on the
> strategy
> > > used for identifying the child I2C and GPIO nodes for the CP2112
> > > device before moving further toward applying this.
> > > 
> > > Since the DT list is on this thread (as well as Rob+Krzystof), and
> > > this has sat for a little while, I'm assuming that the ball is in
> my
> > > court to seek out an answer/opinion here. (I know folks get a lot
> of
> > > email, so apologies if the correct move would have been to wait a
> bit
> > > longer before following up! Not intending to be rude.)
> > > 
> > > Would it be appropriate / expected that I send a separate email
> thread
> > > to the DT mailing list on their opinion here? Or would that create
> > > more confusion/complexity in adding yet another thread? I did
> create a
> > > separate email thread for the initial DT vs. ACPI conversation we
> had
> > > about accessing children by name or index in a unified way due to
> the
> > > differences in upper/lower case and use-cases, but that
> > > (understandably) didn't seem to gain any traction.
> > > 
> > > Thanks for any insights!
> > > 
> > > Thanks,
> > > Danny Kaehn
> > > 
> > > > > One example is network cards which provide an mdio bus
> > > > > bind through the child "mdio". One example of a specifically a
> > > > > child i2c controller being bound to "i2c" can be found in
> > > > > pine64,pinephone-keyboard.yaml.
> > > > > But it's certainly possible this isn't the desired direction
> moving forward
> > > > > in DT -- my opinion should definitely be taken with a grain of
> salt. Maybe
> > > > > this is something I should follow up on with DT folks on that
> DT vs. ACPI
> > > > > thread made earlier.
> > > > >
> > > > > One thing I did notice when looking at the mfd subsystem is
> that most DT
> > > > > drivers actually match on the compatible string of the child
> nodes, a.e.
> > > > > "silabs,cp2112", "silabs,cp2112-gpio".  "silabs,cp2112-i2c". We
> could
> > > > > implement that here, but I think that would make more sense if
> we were to
> > > > > actually split the cp2112 into mfd & platform drivers, and
> additionally split
> > > > > the DT binding by function.
> > > >
> > > > IIRC (but might be very well mistaken) the compatible strings for
> children
> > > > are discouraged.
> > 
> 

