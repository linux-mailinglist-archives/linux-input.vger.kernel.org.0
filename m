Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AAE46F6416
	for <lists+linux-input@lfdr.de>; Thu,  4 May 2023 06:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjEDEew (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 May 2023 00:34:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjEDEev (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 4 May 2023 00:34:51 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 481A0172D
        for <linux-input@vger.kernel.org>; Wed,  3 May 2023 21:34:50 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id B3E085C021D;
        Thu,  4 May 2023 00:34:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 04 May 2023 00:34:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1683174889; x=1683261289; bh=Eq
        /ZhuiMIEoZutclr4mcJVDc/2YBMO/bUwcVnpDkkWI=; b=ZrrmqX4YQHNcY+jCHz
        hNSKbfbU0dUhM88tuRZeLTCurZlbCB+2iSR6LVAUVicMNspxGz19k1aUKN4LsB8T
        g+ZmalaAYJBCnzh9Up0Igp+1sDlZNWeVJvKPt/q0WuQLWLUUce9+hYWfEyzMPvme
        d1ldqGqVRvk+8d35JiuR3F455+69WHGAY8SSI3ns4gucnmT9gCp18Aan58KGfXrq
        KNNNc7LDANbBzZOsUJADk6iisBWGJvhd0uWFUQVsy0quYX1vYk+XwT255J/rjbod
        lMqlLviCzDFxnPsTNkqnlzhp5XSoNrlUfvNza3plxsCsAAmFKblnhDjXoHFp6Ghv
        JzUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1683174889; x=1683261289; bh=Eq/ZhuiMIEoZu
        tclr4mcJVDc/2YBMO/bUwcVnpDkkWI=; b=fMzj9qkJKDkeJxle01wvL83t7nz1c
        E2JaDjgK45F94eSB87ad2axJdWIkVj5LXJ17lJNSHpoDrq0shZHH2d0RWQ9hQIsu
        cRktTaUV0ehRttg769B597ZFQy7TmyyJ+ii9+wlpBNVpB1EdCsJaPA9fDzRXKBHe
        7CiH1yEeGd4qLJB1X2VBvWakBNF7RjyPvvSH4Fdq3hXmrS5bK+TWc6qAVOryLYFC
        QtzWVdpXpfbawbU8yPm8vxdNhMjXr3pUGaU2v4JD8ZjdXD/JGdqZz0TslzHUmXOp
        f/hakSkPn9mVbV8/LMFG1+UFj+E1IiNpoK1BX6cQEOaHFR3kJz0MbQJDQ==
X-ME-Sender: <xms:6TVTZDJfXZwsvfqyBxGA-itKxctI5gcIQRkzrs4ZpDZ-3LKm9cGu9A>
    <xme:6TVTZHKQVt0CMkUeoc925J0VWRaJ9l8t0qamT7_prbmq8RVqPHBnktINntDDSzCmt
    IfR1AvcPemSVc2wJfw>
X-ME-Received: <xmr:6TVTZLtEGgDkoVsdTFSCwrPRISg4OIjtXzcc4uzGztDQeJgk0mBH6dVnC5WpKVDrefYKpaknpptBbrn0FC60JYUsX92H-Xccht2Z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvledgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheprfgvthgv
    rhcujfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvg
    htqeenucggtffrrghtthgvrhhnpeekvdekgeehfeejgfdvudffhfevheejffevgfeigfek
    hfduieefudfgtedugfetgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
X-ME-Proxy: <xmx:6TVTZMaxNnDFaJSimJ0EhBBUBnLm9BRqUoReaO1kBTo1rI1e5HTNOA>
    <xmx:6TVTZKZZzb051nPC6i21LEPQD7r9B0tvpZ7azuNGTJhZeTQph8g_3Q>
    <xmx:6TVTZADs6GjN813PJype-SIDVH7zwW4jENLFkYIc0XclioSWJvBOkQ>
    <xmx:6TVTZC4bLQYww7-OciADwfYJ2AYK6yx7hrqQvf-W6S7G5gvR5mcw0g>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 May 2023 00:34:46 -0400 (EDT)
Date:   Thu, 4 May 2023 14:34:42 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Jason Gerecke <killertofu@gmail.com>
Cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Joshua Dickens <Joshua@joshua-dickens.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Ping Cheng <ping.cheng@wacom.com>
Subject: Re: [PATCH] HID: wacom: Check for string overflow from strscpy calls
Message-ID: <20230504043442.GB1129520@quokka>
References: <20230414182210.383218-1-jason.gerecke@wacom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414182210.383218-1-jason.gerecke@wacom.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Apr 14, 2023 at 11:22:10AM -0700, Jason Gerecke wrote:
> From: Jason Gerecke <killertofu@gmail.com>
> 
> The strscpy function is able to return an error code when a copy would
> overflow the size of the destination. The copy is stopped and the buffer
> terminated before overflow actually occurs so it is safe to continue
> execution, but we should still produce a warning should this occur.
> 
> Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> Reviewed-by: Ping Cheng <ping.cheng@wacom.com>

Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>

Cheers,
  Peter

> ---
>  drivers/hid/wacom_sys.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> index 8214896adadad..7192970d199a0 100644
> --- a/drivers/hid/wacom_sys.c
> +++ b/drivers/hid/wacom_sys.c
> @@ -2224,7 +2224,9 @@ static void wacom_update_name(struct wacom *wacom, const char *suffix)
>  		} else if (strstr(product_name, "Wacom") ||
>  			   strstr(product_name, "wacom") ||
>  			   strstr(product_name, "WACOM")) {
> -			strscpy(name, product_name, sizeof(name));
> +			if (strscpy(name, product_name, sizeof(name)) < 0) {
> +				hid_warn(wacom->hdev, "String overflow while assembling device name");
> +			}
>  		} else {
>  			snprintf(name, sizeof(name), "Wacom %s", product_name);
>  		}
> @@ -2242,7 +2244,9 @@ static void wacom_update_name(struct wacom *wacom, const char *suffix)
>  		if (name[strlen(name)-1] == ' ')
>  			name[strlen(name)-1] = '\0';
>  	} else {
> -		strscpy(name, features->name, sizeof(name));
> +		if (strscpy(name, features->name, sizeof(name)) < 0) {
> +			hid_warn(wacom->hdev, "String overflow while assembling device name");
> +		}
>  	}
>  
>  	snprintf(wacom_wac->name, sizeof(wacom_wac->name), "%s%s",
> @@ -2500,8 +2504,10 @@ static void wacom_wireless_work(struct work_struct *work)
>  				goto fail;
>  		}
>  
> -		strscpy(wacom_wac->name, wacom_wac1->name,
> -			sizeof(wacom_wac->name));
> +		if (strscpy(wacom_wac->name, wacom_wac1->name,
> +			sizeof(wacom_wac->name)) < 0) {
> +			hid_warn(wacom->hdev, "String overflow while assembling device name");
> +		}
>  	}
>  
>  	return;
> -- 
> 2.40.0
> 
