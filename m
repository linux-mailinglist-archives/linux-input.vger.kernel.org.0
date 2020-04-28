Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B348A1BC0AF
	for <lists+linux-input@lfdr.de>; Tue, 28 Apr 2020 16:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbgD1OIR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Apr 2020 10:08:17 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:52108 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726868AbgD1OIQ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Apr 2020 10:08:16 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 49BNlc73xQz2n;
        Tue, 28 Apr 2020 16:08:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1588082894; bh=3kjocTgjQohJ4pvumUVIZjNBlHYyJdLbO1K0n36TMPo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lIb50WEiUjQ2fPMkU753BcaE+htplcmVRe983VwDjhi35EgHzj11pC1UYmDAPaUVX
         3BOEUavVG3oJhGVCF5L+mGEFnWiBgdRWO3rh0lZMbWSROCB44wo665XLsF6tXv4IXV
         NKwkABYOkU/wsNRXX/oqCzvvHd8zjSVFasWKoOro8lE9btxtAiy33SDZhmj/nFSfdl
         aGVNa5yhLJARq9lfPFugz8ayT0vbqs1Lt+dWTPEV3Nu5iAqlYaB6rw/NbdQx7pezLW
         YKClsBolqx5rHC3IBO8BPNYZyqPZKG/s9nDWMA40G1jUryT7HKoXFuoavaf1XaQ6YX
         NAXm1OVsR17lQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Tue, 28 Apr 2020 16:08:11 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     David Heidelberg <david@ixit.cz>,
        Dmitry Osipenko <digetx@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Scott Liu <scott.liu@emc.com.tw>,
        Linux Input <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 10/10] dt-bindings: input: touchscreen: elants_i2c:
 convert to YAML
Message-ID: <20200428140811.GA4355@qmqm.qmqm.pl>
References: <cover.1587916846.git.mirq-linux@rere.qmqm.pl>
 <222105a9c09ac85f0c03224ef7acb8a6d6e237d5.1587916846.git.mirq-linux@rere.qmqm.pl>
 <CAL_JsqLtvKgZYeb8xqT1nXa1Xja2Dxr6PBKixD6tN50cZ2xH5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLtvKgZYeb8xqT1nXa1Xja2Dxr6PBKixD6tN50cZ2xH5g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Apr 27, 2020 at 04:14:15PM -0500, Rob Herring wrote:
> On Sun, Apr 26, 2020 at 11:11 AM Micha³ Miros³aw
> <mirq-linux@rere.qmqm.pl> wrote:
> >
> > From: David Heidelberg <david@ixit.cz>
> >
> > Convert elants_i2c.txt DT binding to YAML and put into correct directory.
> 
> Resend to the DT list or this won't be in my review queue. Looks okay
> from a quick scan.

Hi Rob,

This is the same patch that David already sent to the list about
a week ago [1].  Do you need it resent? (Whole patchset or just the patch?)

[1] https://lore.kernel.org/linux-devicetree/20200423173253.711725-2-david@ixit.cz/

Best Regards,
Micha³ Miros³aw
