Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41C8B5D0FE
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2019 15:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbfGBNu4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Jul 2019 09:50:56 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:58500 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbfGBNu4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Jul 2019 09:50:56 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190702135054euoutp02e24fafdf8e8ded8908a6f361a3a93ae2~tm1lpTXjl0502605026euoutp02x
        for <linux-input@vger.kernel.org>; Tue,  2 Jul 2019 13:50:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190702135054euoutp02e24fafdf8e8ded8908a6f361a3a93ae2~tm1lpTXjl0502605026euoutp02x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1562075454;
        bh=kM0PAOZlcGdWVDnx1xJTwwuahc1a7vYgK76oZBXb47c=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=sMWK9XTvKafsyBHI7tx0uIr8SZoLEztx7S8tDEdoIZDHOFsG3bXOf1mJMaAtOPoh0
         992Thi2TiaJIb6baI43mm3rXT9Yf1aSaVAZESV2BAQRWE589pAzMrk7i7ha2xH3ju1
         G7POYfi4QRkni/s99zEpcNLHGGnl/0DosAZvuCc4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190702135053eucas1p27fa8afa8ffd95904739239c9087ab582~tm1k-mVWV2180921809eucas1p21;
        Tue,  2 Jul 2019 13:50:53 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id EB.36.04325.D316B1D5; Tue,  2
        Jul 2019 14:50:53 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190702135052eucas1p11e2621af0514505789c7947b84cf133c~tm1kIZxEP3174531745eucas1p18;
        Tue,  2 Jul 2019 13:50:52 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190702135052eusmtrp1a4023efb84b0bc0645425edbba386b10~tm1j6UDrY2300423004eusmtrp1E;
        Tue,  2 Jul 2019 13:50:52 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-81-5d1b613d9404
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 14.CB.04140.C316B1D5; Tue,  2
        Jul 2019 14:50:52 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190702135051eusmtip176499a97ab5902991cdda48ee3d07695~tm1jZuF-w1685916859eusmtip1b;
        Tue,  2 Jul 2019 13:50:51 +0000 (GMT)
Subject: Re: [PATCH v7 1/2] drm/bridge: sil_sii8620: make remote control
 optional.
To:     =?UTF-8?Q?Ronald_Tschal=c3=a4r?= <ronald@innovation.ch>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Lukas Wunner <lukas@wunner.de>,
        Federico Lorenzi <federico@travelground.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-input@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Newsgroups: gmane.linux.kernel,gmane.linux.kernel.input,gmane.comp.video.dri.devel
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <2d0fe94c-a2c9-a8f6-967f-c33b53e86518@samsung.com>
Date:   Tue, 2 Jul 2019 15:50:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190419081926.13567-2-ronald@innovation.ch>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRju2zlnO1qzr6X4plG57kE3CjrdzCDhQP4wkQpFcuVhlm7KTlMr
        MsmwObss08pNy260pFrptFypoNHSmSFKZaEzMB3Fupk3KsvtLPLf8z7v83zv88BHEzInFULv
        Vx/kNGpFqlzsT9Y8G3u5fLMiNGFVc46EOX38oohpuuZCTOfQFzHTMvRbzORet4iZQqeBZPLP
        3ZAwXd+HKabDVipmXAOhjKvHLWKeD18QRUxjBys+UmytsVvCmnQlFFuUD+zl5h1sQ9kdCess
        sIvYM9YKxNb1WEl2sHIOe+lkDRU9Nc5/UxKXuj+D06wMT/RPLi8IS++WZX296iZykHW6HvnR
        gNeCodeE9MiflmEzgvf3LJQw/EDQYrkiEYZBBJ/fWUT/LO7iPLGwuIXgmc3o87sR6Mp6KI9q
        Jo6F0/pSryoQm0RgLzaJPAOBXQjOf2glPaoAHAN1o+1eLMZL4XdV14SDpqU4HMYLgzw0iRdA
        Z2eNVxKEd0OH1YY8WIpnQHNJn5f3wxtg1NXvjUfgYHjbd8WH50JutYnw3AV8jgbzq4cSocM2
        sN4bIAQ8Ez7arT5+NjjOnyIFfAyc5hM+sw5B9f1an2EjNNnbKU9QYiK0xbZSoLfCT4fnHXoC
        B8Ab9wwhQwAU1lwkBFoKujyZoA4D54tqwoDmGye1MU5qYJzUwPj/VjkiK1Awp+VVSo5fo+Yy
        V/AKFa9VK1fsS1NVoolv5xi3Dz1C9b/2NiJMI/k0aXl0aIKMUmTwh1SNCGhCHihtMM9KkEmT
        FIcOc5q0PRptKsc3olCalAdLj0zpjZdhpeIgl8Jx6Zzm31ZE+4XkoLOqiGj82a+ytr/xwcJr
        yux5fMqIJqvtz6ZdD0aGq4oNQ+nZHd+O6LmTBy4k2jrzb8qV9XFL4t9WLCg2bNl59+uTWOUW
        3WBMq3J363je00VHAxf25jq0y3K7t8dERI6W8vMv3/7Ttm5x1KfE4cQo+evH5sgxpmidw6av
        cmZK1FnrB+Qkn6xYvYzQ8Iq/0G+w8XIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLIsWRmVeSWpSXmKPExsVy+t/xu7o2idKxBpeOcVv0Nk1nsji86AWj
        xZWv79ksTn39y2bRvHg9m8Wk+xNYLDonLmG3uPnpG6vF5V1z2CxePJe2eHHvLZPFiW/TmBx4
        PD6vesXqsXPWXXaP2R0zWT2mdEp4zDsZ6LF/7hp2j/vdx5k8+rasYvTYe28Li8fnTXIeM9q3
        sQZwR+nZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehl
        LOhWLLgrVPFh4VvmBsYt/F2MnBwSAiYSb6e2sXUxcnEICSxllLiz5hw7REJcYvf8t8wQtrDE
        n2tdUEWvGSV2/F/OCJIQFgiR6O2aA5YQEZjPJHHr5z92EIdZ4BWjxP3108Cq+ASCJPb+uMgC
        YgsJZEpc33GHCcRmE9CU+Lv5JlA3BwevgJ3Ev0miIGEWARWJK1e2gZWLCkRI9LXNZgOxeQUE
        JU7OfAIW5xSwkvjx4hnYGGYBdYk/8y4xQ9jiEreezIeKy0s0b53NPIFReBaS9llIWmYhaZmF
        pGUBI8sqRpHU0uLc9NxiI73ixNzi0rx0veT83E2MwKjfduznlh2MXe+CDzEKcDAq8fB6+EnH
        CrEmlhVX5h5ilOBgVhLh3b9CMlaINyWxsiq1KD++qDQntfgQoynQcxOZpUST84EJKa8k3tDU
        0NzC0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8TB6dUA+MGBofSYsVpevV8GRs3t+6K
        KJH+z7O968a/1VMDbz1NFd9UuO2ocbfgb073u5N12jcGyXLP+d9+Nz7wnrv075TCi1/3PH67
        30aH3dkmNyR4kuyF07EXgifzfZkjO+X13POll0Of9tnel6ubZpLpfCikSMKlO/PQ8V2XE8rF
        5mXM+sGeaX91t6USS3FGoqEWc1FxIgC8cTM9EAMAAA==
X-CMS-MailID: 20190702135052eucas1p11e2621af0514505789c7947b84cf133c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190702135052eucas1p11e2621af0514505789c7947b84cf133c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190702135052eucas1p11e2621af0514505789c7947b84cf133c
References: <20190419081926.13567-1-ronald@innovation.ch>
        <20190419081926.13567-2-ronald@innovation.ch>
        <CGME20190702135052eucas1p11e2621af0514505789c7947b84cf133c@eucas1p1.samsung.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 19.04.2019 10:19, Ronald Tschalär wrote:
> commit d6abe6df706c (drm/bridge: sil_sii8620: do not have a dependency
> of RC_CORE) changed the driver to select both RC_CORE and INPUT.
> However, this causes problems with other drivers, in particular an input
> driver that depends on MFD_INTEL_LPSS_PCI (to be added in a separate
> commit):
> 
>   drivers/clk/Kconfig:9:error: recursive dependency detected!
>   drivers/clk/Kconfig:9:        symbol COMMON_CLK is selected by MFD_INTEL_LPSS
>   drivers/mfd/Kconfig:566:      symbol MFD_INTEL_LPSS is selected by MFD_INTEL_LPSS_PCI
>   drivers/mfd/Kconfig:580:      symbol MFD_INTEL_LPSS_PCI is implied by KEYBOARD_APPLESPI
>   drivers/input/keyboard/Kconfig:73:    symbol KEYBOARD_APPLESPI depends on INPUT
>   drivers/input/Kconfig:8:      symbol INPUT is selected by DRM_SIL_SII8620
>   drivers/gpu/drm/bridge/Kconfig:83:    symbol DRM_SIL_SII8620 depends on DRM_BRIDGE
>   drivers/gpu/drm/bridge/Kconfig:1:     symbol DRM_BRIDGE is selected by DRM_PL111
>   drivers/gpu/drm/pl111/Kconfig:1:      symbol DRM_PL111 depends on COMMON_CLK
> 
> According to the docs and general consensus, select should only be used
> for non user-visible symbols, but both RC_CORE and INPUT are
> user-visible. Furthermore almost all other references to INPUT
> throughout the kernel config are depends, not selects. For this reason
> the first part of this change reverts commit d6abe6df706c.
> 
> In order to address the original reason for commit d6abe6df706c, namely
> that not all boards use the remote controller functionality and hence
> should not need have to deal with RC_CORE, the second part of this
> change now makes the remote control support in the driver optional and
> contingent on RC_CORE being defined. And with this the hard dependency
> on INPUT also goes away as that is only needed if RC_CORE is defined
> (which in turn already depends on INPUT).
> 
> CC: Inki Dae <inki.dae@samsung.com>
> CC: Andrzej Hajda <a.hajda@samsung.com>
> CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Ronald Tschalär <ronald@innovation.ch>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>


Apparently this patch was not queued to kernel yet. If there are no
objections I will queue it via drm-misc-next tree tomorrow.

Regards
Andrzej
