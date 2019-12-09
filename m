Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBB0C116E62
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2019 15:00:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbfLIOAB convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Mon, 9 Dec 2019 09:00:01 -0500
Received: from mga05.intel.com ([192.55.52.43]:1359 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726687AbfLIOAB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 9 Dec 2019 09:00:01 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Dec 2019 06:00:00 -0800
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; 
   d="scan'208";a="206898784"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Dec 2019 05:59:56 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        intel-gfx@lists.freedesktop.org,
        Bruno =?utf-8?Q?Pr=C3=A9mont?= <bonbons@linux-vserver.org>,
        linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v3 09/12] HID: picoLCD: constify fb ops
In-Reply-To: <f415010cd52cce7d8a1250d4eca582ec64e67956.1575390741.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1575390740.git.jani.nikula@intel.com> <f415010cd52cce7d8a1250d4eca582ec64e67956.1575390741.git.jani.nikula@intel.com>
Date:   Mon, 09 Dec 2019 15:59:53 +0200
Message-ID: <87wob54n1i.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 03 Dec 2019, Jani Nikula <jani.nikula@intel.com> wrote:
> Now that the fbops member of struct fb_info is const, we can start
> making the ops const as well.
>
> v2: fix	typo (Christophe de Dinechin)
>
> Cc: Bruno Prémont <bonbons@linux-vserver.org>
> Cc: linux-input@vger.kernel.org
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Acked-by: Bruno Prémont <bonbons@linux-vserver.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Pushed to drm-misc-next, with Jiri's ack from the other thread [1],
thanks for the reviews and acks.

BR,
Jani.

[1] http://lore.kernel.org/r/nycvar.YFH.7.76.1912080106260.4603@cbobk.fhfr.pm


> ---
>  drivers/hid/hid-picolcd_fb.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/hid/hid-picolcd_fb.c b/drivers/hid/hid-picolcd_fb.c
> index e162a668fb7e..a549c42e8c90 100644
> --- a/drivers/hid/hid-picolcd_fb.c
> +++ b/drivers/hid/hid-picolcd_fb.c
> @@ -417,8 +417,7 @@ static int picolcd_set_par(struct fb_info *info)
>  	return 0;
>  }
>  
> -/* Note this can't be const because of struct fb_info definition */
> -static struct fb_ops picolcdfb_ops = {
> +static const struct fb_ops picolcdfb_ops = {
>  	.owner        = THIS_MODULE,
>  	.fb_destroy   = picolcd_fb_destroy,
>  	.fb_read      = fb_sys_read,

-- 
Jani Nikula, Intel Open Source Graphics Center
