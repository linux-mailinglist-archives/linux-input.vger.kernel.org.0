Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B232014EF57
	for <lists+linux-input@lfdr.de>; Fri, 31 Jan 2020 16:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728752AbgAaPPs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 31 Jan 2020 10:15:48 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:60683 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728686AbgAaPPs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 31 Jan 2020 10:15:48 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 0AECC2EC;
        Fri, 31 Jan 2020 10:15:46 -0500 (EST)
Received: from imap6 ([10.202.2.56])
  by compute3.internal (MEProxy); Fri, 31 Jan 2020 10:15:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=8tT4Th
        xheNP/m+NIxcSbeQIYqnrH0l3TLZ1cJxICk24=; b=WBZPxYtpG/U9HvLzWKwlL5
        b1ORqC+5kBZxUgKWUT1CSn9RS1ROsTmOyAw1y7ahtY5JsxQpuLi3fa68dPZIIaqL
        cMAqBoF17EucBVHQ1jVQCmrGBOvTvImZpUa+hx5DvGX7Q4bkHaTo64R5S3KRp+o+
        GMAckrLLpGyeCMHW1UuqTI2HeZ8DLnSqg64thG4DzgKLcVwUVf80lr4op0XMSzxT
        KcO52orC8RS0FTTrLKpLE4Qdxy4xA2mnJ+G8sRY6G7DkzWY2vAvcY0I8+4NdnPha
        N5347VzRogv6sjj0JkeL1y2lbwDtaLHbv8zxglqgTgS1SNRJ7ZDPatsNLZEvCZ8A
        ==
X-ME-Sender: <xms:okQ0Xm-e4CTBLRCH2tiIRkAPLA4WdPPnfKnxCLBVn8gh7wTib1tGTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrgedtgdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfffgrnhhi
    vghlucfnohgtkhihvghrfdcuoehhihesuggrnhhivghllhhotghkhigvrhdrtghomheqne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhephhhisegu
    rghnihgvlhhlohgtkhihvghrrdgtohhm
X-ME-Proxy: <xmx:okQ0XtPOvDf-tWRqqx6U1Hw5sR0eEwcaaDXk07mciB5I30MNnk6wsw>
    <xmx:okQ0XqCso5o5dEJh_z_SWbLQQGyYXJlVpGJcdd6VN0jbtrCJjv2mqQ>
    <xmx:okQ0XhOM8tWXuUQXNRnZ5diNz8i1tb6I1h1W-TcRgzaXpz-Huq3M-g>
    <xmx:okQ0Xr6d_SzuKTIIj9QvAEJFFlecKA0pLD_iADUZ0vg_c_5UmnSWNQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 3A5161400A1; Fri, 31 Jan 2020 10:15:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-781-gfc16016-fmstable-20200127v1
Mime-Version: 1.0
Message-Id: <d589df0f-1ad0-48cf-bee9-3e4a859edc1e@www.fastmail.com>
In-Reply-To: <CAO-hwJLba+CPcWNcB2CK+JU7npM9sMjHYkOWAS=VCuvdtzRDcg@mail.gmail.com>
References: <20200130192126.GA101099@ariel>
 <CAO-hwJLba+CPcWNcB2CK+JU7npM9sMjHYkOWAS=VCuvdtzRDcg@mail.gmail.com>
Date:   Fri, 31 Jan 2020 15:15:20 +0000
From:   "Daniel Lockyer" <hi@daniellockyer.com>
To:     "Benjamin Tissoires" <benjamin.tissoires@redhat.com>
Cc:     "Jiri Kosina" <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Subject: Re: [PATCH] HID: Add quirk for Apple Magic Keyboard over Bluetooth
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

Please ignore my patch. I was experiencing weird things with the hid-generic driver constantly binding over the hid-apple one, but can't seem to reproduce it now.

The actual fix for my issue was posted by Mansour Behabadi to this mailing list on January 29th - "HID: apple: Add support for recent firmware". I have tested this locally and it works great.

Kind regards,
Daniel

On Fri, 31 Jan 2020, at 09:18, Benjamin Tissoires wrote:
> Hi Daniel,
> 
> On Thu, Jan 30, 2020 at 8:31 PM Daniel Lockyer <hi@daniellockyer.com> wrote:
> >
> > The Apple Magic Keyboard works flawlessly over USB but has weird bugs
> > over Bluetooth. This patch adds the missing quirk.
> >
> > Signed-off-by: Daniel Lockyer <hi@daniellockyer.com>
> > ---
> >  drivers/hid/hid-quirks.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> > index 0e7b2d998395..6d68a9201e1d 100644
> > --- a/drivers/hid/hid-quirks.c
> > +++ b/drivers/hid/hid-quirks.c
> > @@ -280,6 +280,7 @@ static const struct hid_device_id hid_have_special_driver[] = {
> >         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ANSI) },
> >         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ISO) },
> >         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_JIS) },
> > +       { HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_ANSI) },
> 
> That is weird. The whole purpose of this list (which I'd like to
> remove in the future) is to prevent hid-generic to ever bind to those
> devices. This can be problematic in situations where you do not have
> the corresponding driver, in the initrd for instance.
> 
> Can you share your dmesg before and after applying this patch so I get
> a grasp on why you need that change?
> 
> Cheers,
> Benjamin
> 
> >         { HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_ANSI) },
> >         { HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_FOUNTAIN_TP_ONLY) },
> >         { HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_GEYSER1_TP_ONLY) },
> > --
> > 2.25.0
> >
> 
>
