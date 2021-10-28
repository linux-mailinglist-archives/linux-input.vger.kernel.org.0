Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7589143E5BF
	for <lists+linux-input@lfdr.de>; Thu, 28 Oct 2021 18:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbhJ1QKG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Oct 2021 12:10:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbhJ1QKF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Oct 2021 12:10:05 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1805C061570;
        Thu, 28 Oct 2021 09:07:38 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id d128so2678709vkf.11;
        Thu, 28 Oct 2021 09:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=utJYicnclzOTw8CLsFuIC+zUBac+ra5fM6a8h3LYNn4=;
        b=ZYKWoH7zWlMBPR7k2Q/RYQP1KMqAN/fu/oKb7XVsdtcL1y/2uosuJkkWFRo3e7APls
         pyRN9OteGfXtvea4D1lNAVOwRH6a8d5zDydKBNIGILWaK1YDwE6LeGaFwtKkdkEinlv2
         esoFqT/Z1ZI0MEtJO9/pCEiL/+a3YnjvivA+Acnbqa6og4nhi9beM/Y7N6htkqQujDMq
         A9ajpNLrWTSNiJiTTNkA7RIHF4DYYaWgzvuy8XuomgveK5DZo6lBx0w0psVVhEfd91wd
         tJRens1s2IHcXzHn9laMPWuAFsakn5A+r4fxmWn7JUnXQ3IKw+r7l8v8/+JV9Govgkj9
         NAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=utJYicnclzOTw8CLsFuIC+zUBac+ra5fM6a8h3LYNn4=;
        b=sevkmPQSOl6dTC+m9SIxCKtZPMAI7oV6xnkKv0Y7lhFc8IItzE5fepEB8pg/ADGsBn
         YMjs4F5REic1iKCRWZWpTkJ4vXSNwn7IUoP7eLxR+uZuK5IU+xhqBWE1sLTnNg2C2aGj
         9u+YiCOFhviEyPVhDbG6425LWetgi1Ypo4HAwx/fmR3vmrCWZ0cXDBB4HF6Q9LRwr9+/
         75rfvHJ5p8Al2/UCQaOYpuU76x4FO5coj4SXNdZVXJaoxGNiNYlRW0ifQe4T7tf49iWi
         GxhzHyVkHz2pt/zp7N2XA6ogy0Bny5rpezNxbZAkjuc3uI6xp5hB4vQJg/TNzJPS46Q6
         msOg==
X-Gm-Message-State: AOAM530EMzwEKxVoheZfYiQoURC7I+r/11g7rbgsqG/CLbCmgyjONYd1
        Qj6CxaOLpAgNF+hASMUev6pZLbXb0/0gi9I2Pmk=
X-Google-Smtp-Source: ABdhPJz54cer+Yx278eLZeBzF09ZWQQMS/3swHVpOgVwyCuGWBrrJJ6tLDd20xV3FAPQeU72dPaUqk7Y5BoChmUWqy4=
X-Received: by 2002:a05:6122:a03:: with SMTP id 3mr2784135vkn.8.1635437257636;
 Thu, 28 Oct 2021 09:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211008222327.9324-1-angiolucci@gmail.com>
In-Reply-To: <20211008222327.9324-1-angiolucci@gmail.com>
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date:   Thu, 28 Oct 2021 09:07:25 -0700
Message-ID: <CAKdAkRTdCSC_6UqWkcT3p697+d0kwEqMSSR=M9vw-NPAjdZ4SQ@mail.gmail.com>
Subject: Re: [PATCH] HID: hid-asus.c: Maps key 0x35 (display off) to KEY_SCREENLOCK
To:     =?UTF-8?Q?Vin=C3=ADcius_Angiolucci_Reis?= <itsme.vreis@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, angiolucci@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Vin=C3=ADcius,

On Fri, Oct 8, 2021 at 3:24 PM Vin=C3=ADcius Angiolucci Reis
<itsme.vreis@gmail.com> wrote:
>
> On Windows systems, ASUS laptops uses the "turn display off" key
> (usually fn+f6) to turn both display and keyboard backlit off. On Linux
> systems, this key has no effect at all since most desktop enviroments
> don't deal with KEY_DISPLAY_OFF. By mapping it to KEY_SCREENLOCK
> instead, would enable desktop environments to handle this key as a
> screen lock intent from the user, out of the box.

But is it the intent of the user? The fact that current desktop
environments do not handle this key is not a reason to change kernel
behavior.

If screen lock is simply your preference then you can change the
mapping via udev on your system without the need to patch the kernel.

Thanks.

--
Dmitry
