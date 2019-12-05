Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36F74113E4D
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2019 10:39:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729412AbfLEJjA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Thu, 5 Dec 2019 04:39:00 -0500
Received: from mga09.intel.com ([134.134.136.24]:5977 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728707AbfLEJjA (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 5 Dec 2019 04:39:00 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Dec 2019 01:39:00 -0800
X-IronPort-AV: E=Sophos;i="5.69,280,1571727600"; 
   d="scan'208";a="201721282"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Dec 2019 01:38:56 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     Bruno =?utf-8?Q?Pr=C3=A9mont?= <bonbons@linux-vserver.org>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, ville.syrjala@linux.intel.com,
        linux-input@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jiri Kosina <jikos@kernel.org>
Subject: Re: [PATCH v2 11/14] HID: picoLCD: constify fb ops
In-Reply-To: <20191202094047.34525a7d@aether.lan.sysophe.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1575022735.git.jani.nikula@intel.com> <8678a9a3566279c881bb4db944850eef35d0a4bb.1575022735.git.jani.nikula@intel.com> <20191202094047.34525a7d@aether.lan.sysophe.eu>
Date:   Thu, 05 Dec 2019 11:38:53 +0200
Message-ID: <871rtji02a.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 02 Dec 2019, Bruno Prémont <bonbons@linux-vserver.org> wrote:
> Hi Jani,
>
> On Fri, 29 Nov 2019 12:29:41 Jani Nikula <jani.nikula@intel.com> wrote:
>> Now that the fbops member of struct fb_info is const, we can start
>> making the ops const as well.
>>
>> v2: fix	typo (Christophe de Dinechin)
>
> Fine with me.
> I don't think going through drm-misc would trigger any conflict, but
> adding Jiri to CC for the case there was any preference.
>
> Acked-by: Bruno Prémont <bonbons@linux-vserver.org>

No response, may I proceed with merging this through drm-misc please?

BR,
Jani.

>
>> Cc: Bruno Prémont <bonbons@linux-vserver.org>
>> Cc: linux-input@vger.kernel.org
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/hid/hid-picolcd_fb.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>> 
>> diff --git a/drivers/hid/hid-picolcd_fb.c b/drivers/hid/hid-picolcd_fb.c
>> index e162a668fb7e..a549c42e8c90 100644
>> --- a/drivers/hid/hid-picolcd_fb.c
>> +++ b/drivers/hid/hid-picolcd_fb.c
>> @@ -417,8 +417,7 @@ static int picolcd_set_par(struct fb_info *info)
>>  	return 0;
>>  }
>>  
>> -/* Note this can't be const because of struct fb_info definition */
>> -static struct fb_ops picolcdfb_ops = {
>> +static const struct fb_ops picolcdfb_ops = {
>>  	.owner        = THIS_MODULE,
>>  	.fb_destroy   = picolcd_fb_destroy,
>>  	.fb_read      = fb_sys_read,
>

-- 
Jani Nikula, Intel Open Source Graphics Center
