Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F08C196A96
	for <lists+linux-input@lfdr.de>; Sun, 29 Mar 2020 04:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbgC2COs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 28 Mar 2020 22:14:48 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:40221 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726415AbgC2COs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 28 Mar 2020 22:14:48 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailnew.nyi.internal (Postfix) with ESMTP id C4CBC5800F5;
        Sat, 28 Mar 2020 22:14:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Sat, 28 Mar 2020 22:14:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=wTD+T1CAWA95GSB8FoKIclW2PuZ
        N3aFveLSHwbRJVfY=; b=alMsCvOgGLttqkyTufc9znSAh5DSu2/TcauIuQrBdqh
        78r/11Y9Hd7vQ+ihW9S2zQrSTnZtArfN7IGuKn1pIagmpQ7+FZGN6rm7lICq2T6R
        nWD9VvTNUqfkOcczicu0xL9Sb7MrJ8krW7i8wnu7NKasIOmmqu8XcCUNY1VyvYi8
        3x3g1/vG8mQeplObKqKZrClWr1uVpk2kmKRFszmap52Q27jPwt7c61i4Fy5P+u0R
        ZgAzUBgLPBmrjrXUKGwF/mWL7WtP29+xYlGPeyyYOMQ0noiJqIx02nO84w2+zO3Q
        AOXyOuyQ2i6hW+jPhU+OYswd0dANbzGpF8nZf25+Blg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=wTD+T1
        CAWA95GSB8FoKIclW2PuZN3aFveLSHwbRJVfY=; b=XwMIsDmsWrozRUwc7geEmx
        jrv9/g9ZgGJ+z6p/Rbnz0A9QGgneyAqkPoPOcetTjoGxjcCveFUVG4OdMTHr67G7
        3FechneAyJXnPVK78pBB30hEgIbDR+zKTx4LgViKths9NQhyWaAaW3gFo9EdzVUB
        fJ/T+hRSKr6BU+F8p8mdTUD5g7E+6tP0Gm3BH/KjW4KXZ+7yVg9a0Ws7KW1S8S4U
        biL4N9dfcpxcRRZwlSsKawa4TwpMpf8Dc7S2F8cGwD8AyLFk/m6BadtTj04U0EWy
        8z/Yzmn3xmZn1vv8ihUdAkRajaysfOPc8ZpwxPquF9nCJfmp1s+3VpCdK7y79K0A
        ==
X-ME-Sender: <xms:lASAXtQosBd8cbHmk0MNO1DWieMPfKInMywSg0rg-oYCriFtv5lt7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudeivddggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvghtvghr
    ucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
    eqnecukfhppeduudejrddvtddrjedurddutdelnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhdrhhhuthhtvghrvghrseifhhhoqd
    htrdhnvght
X-ME-Proxy: <xmx:lASAXrDPRHfFRdiMmSwnUiaHA18XsEjsexPmKpWTTsiBW9kiVdFfvA>
    <xmx:lASAXt16z3LK9MNDweboMyfa82z4INwtQLmSf2QE8iHA5qq4WKBITw>
    <xmx:lASAXpXndEMBmEYijj27PFqgza7EbOuexXY2uhXt3IvXgiIQiggzHw>
    <xmx:lgSAXp9AA8DmN2Y6b0MZ2SvrFM2kTaA6lZh8xpQFsCXwRxTBOqiuog>
Received: from jelly (117-20-71-109.751447.bne.nbn.aussiebb.net [117.20.71.109])
        by mail.messagingengine.com (Postfix) with ESMTPA id 8237B3280060;
        Sat, 28 Mar 2020 22:14:41 -0400 (EDT)
Date:   Sun, 29 Mar 2020 12:14:36 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Johnny Chuang <johnny.chuang.emc@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Rob Schonberger <robsc@google.com>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        James Chen <james.chen@emc.com.tw>,
        Jennifer Tsai <jennifer.tsai@emc.com.tw>,
        Paul Liang <paul.liang@emc.com.tw>,
        Jeff Chuang <jeff.chuang@emc.com.tw>
Subject: Re: [PATCH] Input: elants_i2c - support palm detection
Message-ID: <20200329021436.GA68168@jelly>
References: <1585209525-6047-1-git-send-email-johnny.chuang.emc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585209525-6047-1-git-send-email-johnny.chuang.emc@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Mar 26, 2020 at 03:58:45PM +0800, Johnny Chuang wrote:
> From: Johnny Chuang <johnny.chuang@emc.com.tw>
> 
> Elan define finger/palm detection on the least significant bit of byte 33.
> The default value is 1 for all firmwares, which report as MT_TOOL_FINGER.
> If firmware support palm detection, the bit will change to 0 and
> report as MT_TOOL_PALM when firmware detecting palm.
> 
> Signed-off-by: Johnny Chuang <johnny.chuang@emc.com.tw>
> ---
>  drivers/input/touchscreen/elants_i2c.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index 14c577c..3b4d9eb3 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -73,6 +73,7 @@
>  #define FW_POS_STATE		1
>  #define FW_POS_TOTAL		2
>  #define FW_POS_XY		3
> +#define FW_POS_TOOL_TYPE	33
>  #define FW_POS_CHECKSUM		34
>  #define FW_POS_WIDTH		35
>  #define FW_POS_PRESSURE		45
> @@ -842,6 +843,7 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf)
>  {
>  	struct input_dev *input = ts->input;
>  	unsigned int n_fingers;
> +	unsigned int tool_type;
>  	u16 finger_state;
>  	int i;
>  
> @@ -852,6 +854,12 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf)
>  	dev_dbg(&ts->client->dev,
>  		"n_fingers: %u, state: %04x\n",  n_fingers, finger_state);
>  
> +	/* Note: all fingers have the same tool type */
> +	if (buf[FW_POS_TOOL_TYPE] & 0x01)
> +		tool_type = MT_TOOL_FINGER;
> +	else
> +		tool_type = MT_TOOL_PALM;
> +
>  	for (i = 0; i < MAX_CONTACT_NUM && n_fingers; i++) {
>  		if (finger_state & 1) {
>  			unsigned int x, y, p, w;
> @@ -867,7 +875,7 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf)
>  				i, x, y, p, w);
>  
>  			input_mt_slot(input, i);
> -			input_mt_report_slot_state(input, MT_TOOL_FINGER, true);
> +			input_mt_report_slot_state(input, tool_type, true);
>  			input_event(input, EV_ABS, ABS_MT_POSITION_X, x);
>  			input_event(input, EV_ABS, ABS_MT_POSITION_Y, y);
>  			input_event(input, EV_ABS, ABS_MT_PRESSURE, p);
> @@ -1307,6 +1315,7 @@ static int elants_i2c_probe(struct i2c_client *client,
>  	input_set_abs_params(ts->input, ABS_MT_POSITION_Y, 0, ts->y_max, 0, 0);
>  	input_set_abs_params(ts->input, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
>  	input_set_abs_params(ts->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
> +	input_set_abs_params(ts->input, ABS_MT_TOOL_TYPE, 0, MT_TOOL_MAX, 0, 0);

if you're only reporting pen and palm, can we set this to MT_TOOL_PALM
instead? Otherwise you're indicating you may also send MT_TOOL_DIAL which is
unlikely on this hardware :)

Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net> otherwise

Cheers,
   Peter

>  	input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
>  	input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
>  	input_abs_set_res(ts->input, ABS_MT_TOUCH_MAJOR, 1);
> -- 
> 2.7.4
> 
