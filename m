Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 435CF330FBA
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 14:42:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbhCHNla (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 08:41:30 -0500
Received: from mout.gmx.net ([212.227.17.21]:33981 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229775AbhCHNlV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Mar 2021 08:41:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1615210867;
        bh=bSDYbTjy5zmNKDR127LPeazqoG6StNqkJVm2DIg1YGc=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=RWM7enQIOReekUba+0CO1o3Oi/LC5B7tHkKiZTVg4zsC4zCLo+Wkw1WYSSjjZOGCy
         5oJAJ3IdkWuD1+qpJUNOAh/29UOGfTp1LSWB+6JzS6V1v/xMEI6YW5I0TEnCQywVnR
         PhmiI0qjNQzWodHwD/m8H6GFvBxRpQA+dygWuTgs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.162.6]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MtOKc-1lbc202HRG-00uskQ; Mon, 08
 Mar 2021 14:41:06 +0100
Date:   Mon, 8 Mar 2021 15:42:55 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     'Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        <linux-input@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Hulk Robot" <hulkci@huawei.com>
Subject: Re: [PATCH -next] Input: n64joy - Fix return value check in
 n64joy_probe()
Message-Id: <20210308154255.7ba3722bb91ad97bc36c90c9@gmx.com>
In-Reply-To: <20210308122856.2177071-1-weiyongjun1@huawei.com>
References: <20210308122856.2177071-1-weiyongjun1@huawei.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Tq78aQHuITkbt/KPSHd6ZFmA8xbSmNExVkpy1CPE6TR6Q8KvzVH
 6jlL/qpl4L2rutmHmrLdulJWTSwhC4BrnZbmDuyRadMHe88BqLUe7AHTbxpQGoAXuIxUnRi
 p6ndNPrGqpKz7eyKpp+o2bMHh4SGtjH5WTik2tUU37nZoerKu2AM/gD8Y9bkiA7MsOzy9ug
 du0IqpQo5kDfQVtK64o1A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:K4OS+4Pq8+U=:HcTyaJIhoIFwfcOjGFTDyN
 FehDmMRt3e5VuWi/i9soXVYTXnkFfzVaDmDuyS2IcJzLNUFWtK/Tu6U9YDTszACjMKwD/WCmI
 rcjv4s7L0U41j/11BPwnQsElzHuP6ZOoaAdlr62+Oj3w/Dya5SA/UnBsVaRPLBLJ6nqZ3dPVg
 CJO1iB1ZjcErWnu7GBjOhbdAOn8Uyn0n9sZh3mqblkFrW0Dcrv1s8W0nFLiYvN9rg9rTNEJSH
 qXiyINjDTClRjCOvpWbGUkGiyH6Ru2tMtMZbBYScPimVk9jWQmLrhrFy3KsOm/a0+wqIJlDXr
 FzVwLCNLv1QQ81wRq+OOBYfikFCIzHjoauRD7qaKlpuz0vAajXFNwLSHsTNOaO/GuRkXv03Vx
 5o5TkKgcEEW7JC9h+O1BT0aDdqe3fqQuGUXp5TgaFnlGV5VMFNEQXRS39rCwlAq87De54cStj
 XvOpJbGganHeWhtxkt606h12IAIdNgbdGK1uDddJjkCmvKWBnkjs9rcWA0o303+c6tm+pYCkv
 q85Moqu3aZYjTSsFIa923AqTL1lRF9RG++iKQm3CKasDHtLLLtI5cNexp28WW3LHcyZInlKDG
 XV8kPb/9coEvc2KeS2B7NAdcuy35Kwn+o/Wf+pOyO0WNibOvioy+IbihRjwlr16LtrKbh2A7D
 JBnf84XjAGxb9M+qjPsQlNNL3s8p+MDsNaeBHZHKpFgjbeFgGwMi7jXrTN8r0FEqa8U8x2xPg
 5Ok2sBWHyEAlduijz1/u4VpOxfO0j0dT/O93/JKpPnhLAWLzfx9F0/dMi3bQl6mLqWZ4md3Fx
 ff8xhwWt/pIXUS2ceFG5Y3EKZHinshUx6iaHhY3DLT1e+gP5XXrq+Znzv0ilt6aTDhe69sMUi
 rLgJV4eEtaLq+QXUDEyQ==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 8 Mar 2021 12:28:56 +0000
'Wei Yongjun <weiyongjun1@huawei.com> wrote:

> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> In case of error, the function devm_platform_ioremap_resource()
> returns ERR_PTR() and never returns NULL. The NULL test in the
> return value check should be replaced with IS_ERR().
>
> Fixes: 3bdffa8ffb45 ("Input: Add N64 controller driver")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Lauri Kasanen <cand@gmx.com>

- Lauri
