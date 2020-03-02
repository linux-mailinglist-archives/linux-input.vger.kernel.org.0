Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96667175982
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 12:25:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgCBLZz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 06:25:55 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:54849 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbgCBLZy (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Mar 2020 06:25:54 -0500
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id BBFB320006;
        Mon,  2 Mar 2020 11:25:51 +0000 (UTC)
Message-ID: <9e307819b85a9ee5c828427cc43a7dc4251d2300.camel@hadess.net>
Subject: Re: [PATCH resend 07/10] Input: goodix - Move defines to above
 struct goodix_ts_data declaration
From:   Bastien Nocera <hadess@hadess.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Dmitry Mastykin <mastichi@gmail.com>
Date:   Mon, 02 Mar 2020 12:25:51 +0100
In-Reply-To: <20200221164735.508324-7-hdegoede@redhat.com>
References: <20200221164735.508324-1-hdegoede@redhat.com>
         <20200221164735.508324-7-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.35.91 (3.35.91-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2020-02-21 at 17:47 +0100, Hans de Goede wrote:
> Move the  defines to above the struct goodix_ts_data declaration, so
> that the MAX defines can be used inside the struct goodix_ts_data
> declaration. No functional changes, just moving a block of code.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1786317
> BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199207
> Cc: Dmitry Mastykin <mastichi@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Sure.

Reviewed-by: Bastien Nocera <hadess@hadess.net>

> ---
>  drivers/input/touchscreen/goodix.c | 60 +++++++++++++++-------------
> --
>  1 file changed, 30 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c
> b/drivers/input/touchscreen/goodix.c
> index 784c4dd8c430..66d6bb74507d 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -29,6 +29,36 @@
>  #include <linux/of.h>
>  #include <asm/unaligned.h>
>  
> +#define GOODIX_GPIO_INT_NAME		"irq"
> +#define GOODIX_GPIO_RST_NAME		"reset"
> +
> +#define GOODIX_MAX_HEIGHT		4096
> +#define GOODIX_MAX_WIDTH		4096
> +#define GOODIX_INT_TRIGGER		1
> +#define GOODIX_CONTACT_SIZE		8
> +#define GOODIX_MAX_CONTACT_SIZE		9
> +#define GOODIX_MAX_CONTACTS		10
> +
> +#define GOODIX_CONFIG_MAX_LENGTH	240
> +#define GOODIX_CONFIG_911_LENGTH	186
> +#define GOODIX_CONFIG_967_LENGTH	228
> +
> +/* Register defines */
> +#define GOODIX_REG_COMMAND		0x8040
> +#define GOODIX_CMD_SCREEN_OFF		0x05
> +
> +#define GOODIX_READ_COOR_ADDR		0x814E
> +#define GOODIX_GT1X_REG_CONFIG_DATA	0x8050
> +#define GOODIX_GT9X_REG_CONFIG_DATA	0x8047
> +#define GOODIX_REG_ID			0x8140
> +
> +#define GOODIX_BUFFER_STATUS_READY	BIT(7)
> +#define GOODIX_BUFFER_STATUS_TIMEOUT	20
> +
> +#define RESOLUTION_LOC		1
> +#define MAX_CONTACTS_LOC	5
> +#define TRIGGER_LOC		6
> +
>  struct goodix_ts_data;
>  
>  enum goodix_irq_pin_access_method {
> @@ -68,36 +98,6 @@ struct goodix_ts_data {
>  	unsigned int contact_size;
>  };
>  
> -#define GOODIX_GPIO_INT_NAME		"irq"
> -#define GOODIX_GPIO_RST_NAME		"reset"
> -
> -#define GOODIX_MAX_HEIGHT		4096
> -#define GOODIX_MAX_WIDTH		4096
> -#define GOODIX_INT_TRIGGER		1
> -#define GOODIX_CONTACT_SIZE		8
> -#define GOODIX_MAX_CONTACT_SIZE		9
> -#define GOODIX_MAX_CONTACTS		10
> -
> -#define GOODIX_CONFIG_MAX_LENGTH	240
> -#define GOODIX_CONFIG_911_LENGTH	186
> -#define GOODIX_CONFIG_967_LENGTH	228
> -
> -/* Register defines */
> -#define GOODIX_REG_COMMAND		0x8040
> -#define GOODIX_CMD_SCREEN_OFF		0x05
> -
> -#define GOODIX_READ_COOR_ADDR		0x814E
> -#define GOODIX_GT1X_REG_CONFIG_DATA	0x8050
> -#define GOODIX_GT9X_REG_CONFIG_DATA	0x8047
> -#define GOODIX_REG_ID			0x8140
> -
> -#define GOODIX_BUFFER_STATUS_READY	BIT(7)
> -#define GOODIX_BUFFER_STATUS_TIMEOUT	20
> -
> -#define RESOLUTION_LOC		1
> -#define MAX_CONTACTS_LOC	5
> -#define TRIGGER_LOC		6
> -
>  static int goodix_check_cfg_8(struct goodix_ts_data *ts,
>  			const struct firmware *cfg);
>  static int goodix_check_cfg_16(struct goodix_ts_data *ts,

