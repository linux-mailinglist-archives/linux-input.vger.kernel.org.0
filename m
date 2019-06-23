Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56B044FAB3
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2019 09:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbfFWH7a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 23 Jun 2019 03:59:30 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33177 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbfFWH7a (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 23 Jun 2019 03:59:30 -0400
Received: by mail-pf1-f195.google.com with SMTP id x15so5754308pfq.0;
        Sun, 23 Jun 2019 00:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tzbZWPc5TliQLpCYCWBaSfE3Mf4guf9huwMeK/5OUms=;
        b=nwFVlV5Ta+WdJArKSafsrShCD4X97T68N1Hu/p777Te63d5z93B1EWvNgW08+M3oZ1
         ZwsSmyqtrEea13wMZECxtWf2p76+j28MTTtaXRCyqQ01QZ6ayf47PqLZZlI6H0TU5Z4Z
         LQNoa5zfRscWsJzA2PeayfJ04y8DEZTo3ZfK+oV+dDgq8m+7mhg7tavtxuBRm3d63XqF
         Ch7wtg0muM/t9EADzfgFgliSnJDcMeXW0UTXr1V73XXR3thbw4YoeNaMG3BkjX5Y0pDq
         3h142xgm1O8PVsfNzyg+RBGwRGYg1Eqw2dbPpcbKMSW6XBbMJGdd/IjXR5+/8Gz4KoVH
         5/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tzbZWPc5TliQLpCYCWBaSfE3Mf4guf9huwMeK/5OUms=;
        b=NzQy3h0uQFj8c7r855A/7An3ICFT6/rC0/olPLVeHb4QyRyxhFpUzGueA50elOVBpI
         Uintp4p/PPqldPyY+8SxW1axO8a724117ncyr3dNIFDxaUpWGALft/jfTQ7mlnJNgl0W
         vIApF0hGQO435xbW5pMmoNeJpfhRqacgtP1nMIT5alWupdD3AbnApm4Y5wL2E72VIGC0
         5tzDP1RIgMEBjk0KVjZ6Ie6lDOyHuMtyqASeP2lRaf+AGxwtdDDSU08oCxZVPuWVHlqK
         KbiUrR1RliYLjucyNN6nbMckLS4eji58Jb/BSLN7cgELj7jVpLOXEyR3kOq5RfQ5V6pz
         KFGg==
X-Gm-Message-State: APjAAAWkyn51W1W91PVq0SHrMJoidvqZMqbmpAHAN1iae0cqcHtGKI5b
        Je8hQnG7kGedj+BmgxIqdMV6IDpxN8LI0+Il118=
X-Google-Smtp-Source: APXvYqy1vYFRhDdVrfSfLLL3vOoLQbWRpM035mVv6G9HI+wID8BhG1XBabHDkfjM7kZdYBQmVECM+vhJbaacy4vm9oA=
X-Received: by 2002:a65:448b:: with SMTP id l11mr26312245pgq.74.1561276769381;
 Sun, 23 Jun 2019 00:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190623063153.261546-1-dmitry.torokhov@gmail.com> <20190623063153.261546-2-dmitry.torokhov@gmail.com>
In-Reply-To: <20190623063153.261546-2-dmitry.torokhov@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 23 Jun 2019 10:59:18 +0300
Message-ID: <CAHp75VfgR4d7aOG6XPBXisrfa=30pYfCJZ1Yhh2E44bs8vWmVw@mail.gmail.com>
Subject: Re: [PATCH 2/2] Input: edt-ft5x06 - simplify event reporting code
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Benoit Parrot <bparrot@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jun 23, 2019 at 9:31 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Now that input_mt_report_slot_state() returns true if slot is active we no
> longer need a temporary for the slot state.


> -               down = type != TOUCH_EVENT_UP;
>
>                 input_mt_slot(tsdata->input, id);
> -               input_mt_report_slot_state(tsdata->input, MT_TOOL_FINGER, down);

> +               if (input_mt_report_slot_state(tsdata->input, MT_TOOL_FINGER,
> +                                              type != TOUCH_EVENT_UP))

Can't we simple do somethink like
-               down = type != TOUCH_EVENT_UP;
+               down = input_mt_report_slot_state(tsdata->input,
MT_TOOL_FINGER, type != TOUCH_EVENT_UP);

-- 
With Best Regards,
Andy Shevchenko
