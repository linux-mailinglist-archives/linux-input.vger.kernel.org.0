Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02D86AFBBD
	for <lists+linux-input@lfdr.de>; Wed, 11 Sep 2019 13:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbfIKLsk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Sep 2019 07:48:40 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:38096 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726341AbfIKLsj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Sep 2019 07:48:39 -0400
X-UUID: afe9b7bccc0244c49ffd4eee38f98506-20190911
X-UUID: afe9b7bccc0244c49ffd4eee38f98506-20190911
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <luhua.xu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 909998294; Wed, 11 Sep 2019 19:48:35 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Sep 2019 19:48:23 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Sep 2019 19:48:23 +0800
Message-ID: <1568202307.4352.31.camel@mbjsdccf07>
Subject: Re:  Kernel touch Kconfig consult
From:   luhua xu <luhua.xu@mediatek.com>
To:     Marek Vasut <marex@denx.de>,
        "; Dmitry Torokhov" <dmitry.torokhov@gmail.com>
CC:     Rob Herring <robh@kernel.org>,
        "; Nick Dyer" <nick.dyer@itdev.co.uk>,
        "; Richard Leitner" <richard.leitner@skidata.com>,
        "; Martin Kepplinger" <martink@posteo.de>,
        <"; linux-input"@vger.kernel.org>
Date:   Wed, 11 Sep 2019 07:45:07 -0400
In-Reply-To: <a426382c28b647dd8e95359f30f80333@MTKMBS32N1.mediatek.inc>
References: <1560509239.24963.25.camel@mbjsdccf07>
         <20190623070249.GD204275@dtor-ws>
         <b1ab79bd-e72a-a782-a293-c32f1c09cce9@denx.de>
         <1561515503.11683.16.camel@mbjsdccf07>
         <a426382c28b647dd8e95359f30f80333@MTKMBS32N1.mediatek.inc>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK:  N
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

HI Marek & Dmiitry,
	My colleague and me,we have different voice about this, I would
appreciate your comment about this.

Simply:
I think
https://www.kernel.org/doc/Documentation/kbuild/kconfig-language.txt
supports  to use string type Kconfig, although this type is not used
much;
we use string type kconfig to select which drivers to build in, every 
built in driver itself detect its hw according to its dts info, and
exit if detect fail; 
ifdef chaos in vendor kernel.. I think there is a touch common driver
layer, and common drv and specific drv is not layered ideal.








On Wen, Jun 26, 2019 at 10:18:19AM -0400, luhua.xu wrote:
Hi Marek and Dmitry,


On Sun, 2019-06-23 at 12:43 +0200, Marek Vasut wrote:
> On 6/23/19 9:02 AM, Dmitry Torokhov wrote:
> > Hi,
> >
> > On Fri, Jun 14, 2019 at 06:47:19AM -0400, luhua.xu wrote:
> >> Hi Dmitry,Rob,Marek, Nick,Richard,Martin,
> >>
> >> In our  customer support experience, many smartphone have two or
> >> three touch vendor mixture , and customer use one load to support all touches.
> >> For easy to config touch driver  we use kernel config like this
> >> down below,
> >>
> >> We change the config type from 'bool' to 'string'.
> >>
> >> config TOUCHSCREEN_MTK_TOUCH
> >>   string "Touch IC name for Mediatek package"
> >>   help
> >>     Set touch IC name if you have touch panel.
> >>     To compile this dirver for used touch IC.
> >>
> >>
> >> And we config touch driver like this：
> >> CONFIG_TOUCHSCREEN_MTK_TOUCH="GT9886 GT1151 TD4320"
> >>
> >> I only use one config to support  3 touches, while we have to use 3
> >> config to support 3  touch drivers if we set the config as 'bool'.
> >>
> >> So can I use Kconfig like this?
> >> I do look forward to receiving your reply at your convenience .
> >>
> >
> > I really do not see why having a sting is easier to have than 3
> > bools, especially if they pertain to different touch controllers.
> > You must also have some custom processing of the config above as I
> > am pretty sure our standard build tools would not work for it.
>
> I might be missing something obvious, but isn't DT something you want
> to use on your ARM device to describe the hardware , instead of
> hard-coding it into the kernel configuration ?
>
> I recently worked with MT6797 (the Gemini PDA SoC), and the
> vendorkernel does exactly this, it's a spectacular display of
> ifdeffery and Kconfig chaos, so I suspect this is where the idea of
> putting stuff into Kconfig comes from.
>

Thanks so much for your kindly help and repley.

As time goes by, more and more touch types will be added in our platform. To avoid hard-coding it into the kernel configuration, I use 'string' type Kconfig, and it will aways keeps one config no matter how many touch drivers we want.
For example, we have touch1, touch2...touch10. We need 10 Kconfigs if we use 'bool' type Kconfig.

I have already tested the 'string' type Kconfig, standard build tools supports well. (such as in android P and kernel 4.14).
And the document down below also shows Kbuild have the 'string' type Kconfig https://www.kernel.org/doc/Documentation/kbuild/kconfig-language.txt

Btw, In my opinion, DT is used for configuring  the touch device info such as i2c slaver address. But we need to decide which touch driver should be build in for a project.



