Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 094651FC704
	for <lists+linux-input@lfdr.de>; Wed, 17 Jun 2020 09:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgFQHRZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Jun 2020 03:17:25 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:51135 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgFQHRZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Jun 2020 03:17:25 -0400
Received: from mail-qk1-f176.google.com ([209.85.222.176]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MTiHd-1jJf0o0ELV-00U3CK; Wed, 17 Jun 2020 09:17:23 +0200
Received: by mail-qk1-f176.google.com with SMTP id f18so1146990qkh.1;
        Wed, 17 Jun 2020 00:17:22 -0700 (PDT)
X-Gm-Message-State: AOAM530dJZ6mjfBeAfS/d9WwEiJn0zfjT/FC9+5Izwiob+tpi3+bQKt4
        b0uJ/l3kiHlxc1yOHzpx7v376OL5Fa5LYhI7YUI=
X-Google-Smtp-Source: ABdhPJzrVFsJeqz/gwKfNe9UY0hlG+JXbQ7QhG4NYp9SSFLCcqr2pUVf2YXSUvi3MQNAKYKvvivKDhm4wQjKAZElbSM=
X-Received: by 2002:a37:62ce:: with SMTP id w197mr5265621qkb.394.1592378241742;
 Wed, 17 Jun 2020 00:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200617065539.25805-1-geert+renesas@glider.be> <20200617065539.25805-3-geert+renesas@glider.be>
In-Reply-To: <20200617065539.25805-3-geert+renesas@glider.be>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 17 Jun 2020 09:17:06 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2JuoO42Jw59xrKPHEaib=kuKJ_B4_kPpgxbZAOzv_gBQ@mail.gmail.com>
Message-ID: <CAK8P3a2JuoO42Jw59xrKPHEaib=kuKJ_B4_kPpgxbZAOzv_gBQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] input: i8042 - Remove special Cayman handling
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:RJKJYCkswHgeuAqOT9gUbkjT6i61thmstb/oVsYPNhSKtD9rcp7
 AizRbtCoDO4xAQhW4JKAaVGbi8y7tTvA8DbAkyRrno+K5hFifOvjckeef0xDwrvm0aUlh/3
 IdW6WoM51HRdhv1+gHPdahXw/DYStRg85tkPwIuBKz8QhvF0jk6FOM83mYI1FLhvrleFaw8
 lpFVDsiHXyPZnOcICTv+w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:A2ARPWA6N8M=:OyZE4vE//AQWmgQi6QLCoT
 d49CRVevq4kY1BhgZhk/6Dkox9DVF/Vh3diki+WeGgDGQTPpMBUcUYlHR7HrLD3QGYBIzN/pd
 SYfN5CSUf+hsKoGQi69vgPPT4SC1pZpXd54lggwNT06ZLf2Q0m1uzEMp2XcqdWFAH5tzkENwd
 JrK4qaW/DJsoyv+uO/XOobphTwqhcO/VNUp4TTrGGO2snBTxOBYGd5+qdQ1/l9dPVaF5KeIr1
 3KUL5YWp+u+Gv4bFNWGpyFcyTo03zHgbyhr643miGohnQ9ImTkt89cN80oJdaMYp5Jo+NWnKH
 nM9QvoS9lWSRrV3aR5YrOLE/6WAwbzNSyGep5jnjeRPT2VvdoxFoulMymyqx7wBwrwuL2NGqo
 41EmB9KRTVf5D2o5wLRnvhx3aDgCKBvk2lvoqbwaYsQdOsPwJxRIiCsk4722/gq9+1Rf4O/cZ
 DkBe77KxmqgBfLLo/shzjbl+YR1LmJweH2cdj/uTVuri30dXi7/8rgJOC1+LfITegcC3eB5rU
 2b+k6txBUukJamlmNJw+bsszqPcayHz+HNXMAYkcnNdEMYlOO/hfwUYgFBp6MJpqm6DwvTjtk
 XNJDDAx8ViDKjKN5P3r5DCCmsslwTKXW6sdNc89nApMpC2VbA0xqS1aql2/UPA9jW2Vqk5MO8
 cGoL6ula8AK5usoI0/XX1SA6cX6Tc7WumxCgP3cNlKcJ/Hq7a6ub4yz9whx4r7usG3GxFtVLz
 X1NCyJMAiG3mAIH3+g1+IxS6p2jHmQ0Y8QAFwbPkfgfiYVJ4eXJJ53RXopSm5+1IftHyOOix9
 Jm6faFanILFSGx31UpyW6SH7faJzvswo+j5TGROaFGNi6wgMlE=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 17, 2020 at 8:55 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> As of commit 37744feebc086908 ("sh: remove sh5 support"), support for
> the SH5-based Cayman platform can no longer be selected.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Acked-by: Arnd Bergmann <arnd@arndb.de>
