Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8AED1770E7
	for <lists+linux-input@lfdr.de>; Tue,  3 Mar 2020 09:15:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727644AbgCCIPi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Mar 2020 03:15:38 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:42787 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727594AbgCCIPi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Mar 2020 03:15:38 -0500
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 5677C240038;
        Tue,  3 Mar 2020 08:15:03 +0000 (UTC)
Message-ID: <fe4e0010826d4d18843b148dc088c2b01c7e2072.camel@hadess.net>
Subject: Re: [PATCH 1/2] Input: Add keycodes for keyboard backlight control
From:   Bastien Nocera <hadess@hadess.net>
To:     Rajat Jain <rajatja@google.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        dtor@google.com
Cc:     rajatxjain@gmail.com
Date:   Tue, 03 Mar 2020 09:15:02 +0100
In-Reply-To: <20200303005645.237763-1-rajatja@google.com>
References: <20200303005645.237763-1-rajatja@google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.35.92 (3.35.92-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2020-03-02 at 16:56 -0800, Rajat Jain wrote:
> New keyboards can have backlight control keys. Allocating keycodes
> for them. Such keyboards are already available in ChromeOS.
> 
> Signed-off-by: Rajat Jain <rajatja@google.com>
> ---
>  include/uapi/linux/input-event-codes.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/uapi/linux/input-event-codes.h
> b/include/uapi/linux/input-event-codes.h
> index 0f1db1cccc3fd..e12a19dc30262 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -652,6 +652,10 @@
>  /* Electronic privacy screen control */
>  #define KEY_PRIVACY_SCREEN_TOGGLE	0x279
>  
> +/* Keyboard Backlight control */
> +#define KEY_KBD_BKLIGHT_UP              0x280
> +#define KEY_KBD_BKLIGHT_DOWN            0x281

There's already KEY_KBDILLUMDOWN and KEY_KBDILLUMUP, used since the
aluminium PowerBook G4 in 2005 (commit
146a4b3bdfb5641bfbf975e29680b482b8b343ba)

> +
>  /*
>   * Some keyboards have keys which do not have a defined meaning,
> these keys
>   * are intended to be programmed / bound to macros by the user. For
> most

