Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B42035DEF9
	for <lists+linux-input@lfdr.de>; Tue, 13 Apr 2021 14:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbhDMMfQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Apr 2021 08:35:16 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:54519 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbhDMMfQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Apr 2021 08:35:16 -0400
Received: from [192.168.1.150] (unknown [78.199.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 6415B20000E;
        Tue, 13 Apr 2021 12:34:52 +0000 (UTC)
Message-ID: <a2be79bcf1ce93096d6843a0856927cda65d4842.camel@hadess.net>
Subject: Re: [PATCH] [v4] Input: Add "Select" button to Microsoft Xbox One
 controller.
From:   Bastien Nocera <hadess@hadess.net>
To:     Chris Ye <lzye@google.com>,
        =?UTF-8?Q?=C5=81ukasz?= Patron <priv.luk@gmail.com>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Olivier =?ISO-8859-1?Q?Cr=EAte?= <olivier.crete@ocrete.ca>,
        Sanjay Govind <sanjay.govind9@gmail.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        trivial@kernel.org, kernel-team@android.com
Date:   Tue, 13 Apr 2021 14:34:51 +0200
In-Reply-To: <20210413010252.2255812-1-lzye@google.com>
References: <20210413010252.2255812-1-lzye@google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0 (3.40.0-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 2021-04-13 at 01:02 +0000, Chris Ye wrote:
> Add "Select" button input capability and input event mapping for
> Microsoft Xbox One controller. From product site this is also
> referred as
> "Share" button.
> Fixed Microsoft Xbox One controller select button not working under
> USB
> connection.
> 
> Signed-off-by: Chris Ye <lzye@google.com>
> ---
>  drivers/input/joystick/xpad.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/joystick/xpad.c
> b/drivers/input/joystick/xpad.c
> index 9f0d07dcbf06..99cb8bb78570 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -79,6 +79,7 @@
>  #define MAP_DPAD_TO_BUTTONS            (1 << 0)
>  #define MAP_TRIGGERS_TO_BUTTONS                (1 << 1)
>  #define MAP_STICKS_TO_NULL             (1 << 2)
> +#define MAP_SELECT_BUTTON              (1 << 3)
>  #define DANCEPAD_MAP_CONFIG    (MAP_DPAD_TO_BUTTONS
> |                  \
>                                 MAP_TRIGGERS_TO_BUTTONS |
> MAP_STICKS_TO_NULL)
>  
> @@ -130,6 +131,7 @@ static const struct xpad_device {
>         { 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", 0,
> XTYPE_XBOXONE },
>         { 0x045e, 0x02ea, "Microsoft X-Box One S pad", 0,
> XTYPE_XBOXONE },
>         { 0x045e, 0x0719, "Xbox 360 Wireless Receiver",
> MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
> +       { 0x045e, 0x0b12, "Microsoft Xbox One X pad",
> MAP_SELECT_BUTTON, XTYPE_XBOXONE },
>         { 0x046d, 0xc21d, "Logitech Gamepad F310", 0, XTYPE_XBOX360
> },
>         { 0x046d, 0xc21e, "Logitech Gamepad F510", 0, XTYPE_XBOX360
> },
>         { 0x046d, 0xc21f, "Logitech Gamepad F710", 0, XTYPE_XBOX360
> },
> @@ -862,6 +864,8 @@ static void xpadone_process_packet(struct
> usb_xpad *xpad, u16 cmd, unsigned char
>         /* menu/view buttons */
>         input_report_key(dev, BTN_START,  data[4] & 0x04);
>         input_report_key(dev, BTN_SELECT, data[4] & 0x08);
> +       if (xpad->mapping & MAP_SELECT_BUTTON)
> +               input_report_key(dev, KEY_RECORD, data[22] & 0x01);
>  
>         /* buttons A,B,X,Y */
>         input_report_key(dev, BTN_A,    data[4] & 0x10);
> @@ -1669,9 +1673,11 @@ static int xpad_init_input(struct usb_xpad
> *xpad)
>  
>         /* set up model-specific ones */
>         if (xpad->xtype == XTYPE_XBOX360 || xpad->xtype ==
> XTYPE_XBOX360W ||
> -           xpad->xtype == XTYPE_XBOXONE) {
> +               xpad->xtype == XTYPE_XBOXONE) {

Why the indentation change here?

>                 for (i = 0; xpad360_btn[i] >= 0; i++)
>                         input_set_capability(input_dev, EV_KEY,
> xpad360_btn[i]);
> +               if (xpad->mapping & MAP_SELECT_BUTTON)
> +                       input_set_capability(input_dev, EV_KEY,
> KEY_RECORD);
>         } else {
>                 for (i = 0; xpad_btn[i] >= 0; i++)
>                         input_set_capability(input_dev, EV_KEY,
> xpad_btn[i]);


