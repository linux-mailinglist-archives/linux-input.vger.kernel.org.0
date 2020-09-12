Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9BF2676FA
	for <lists+linux-input@lfdr.de>; Sat, 12 Sep 2020 02:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725959AbgILAui (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Sep 2020 20:50:38 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:52418 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbgILAuh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Sep 2020 20:50:37 -0400
IronPort-SDR: S7HKLIEgVQCnVBwByHnjbWJSIAn4vkbuUc8GmSB/lCpxPOpJaOdY0h7UZetQNlwdyH0BqNhSJf
 gRBHCWXeyhe3R76LAbWIIutPaRoUctShu+lJ1RWDRbgjpSLKkdZqxEf00/FvKX7wnqXREu4gCg
 +5a83F09TJw72HJweJatqdho7MKLoce5gIZGBBlg+LMdeCHyrvy1L9nmcIORczC5BoPJ//loA5
 ojexcn7KFtPNA08RmfvfAVd9VKk+gq72eruUm25zSMFsEYnXXAPnyLgoFWuGhk4fY7tCX6W1mI
 lS0=
X-IronPort-AV: E=Sophos;i="5.76,418,1592899200"; 
   d="scan'208";a="55030244"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 11 Sep 2020 16:50:36 -0800
IronPort-SDR: KLfswWze6mM3NcT/VAwlPzjKpTgBvcxDKrC3RMH+3ebPQz3g3B0AlcamgH8b/6BerHVi/xzSjk
 TmAzUIJVC3PbKKMaoKZpxoCsuKRgjZOXp30IWFiDNmRzQFvvRqQST5rmUEpSy5j4kXNBXrLZwv
 YSdapYxkMPFN4WYbsh+WiiNDpgIrCvjyCSrTlRpPxwc892DdHuacZsC7vOlvjcrl6+BzrUZp4S
 yzhq745oT69N7nSOGpSuhm/aMHm0w8y01mJjqLkP5VSR/2w/9VDFUL7CBsV4RkQPxFEZOOQmgS
 PsU=
Subject: Re: [PATCH v2 1/1] Input: atmel_mxt_ts - implement I2C retries
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     "nick@shmanahar.org" <nick@shmanahar.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Andrew_Gabbasov@mentor.com" <Andrew_Gabbasov@mentor.com>,
        "erosca@de.adit-jv.com" <erosca@de.adit-jv.com>,
        "digetx@gmail.com" <digetx@gmail.com>
References: <20200903155904.17454-1-jiada_wang@mentor.com>
 <CAHp75Vfw1bJ+0pRJKVJ=nCJ-5rVzYLjkP4iWPqiG-it0qp5GFg@mail.gmail.com>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <7c57ae66-41ad-aba3-a466-6c6f79652638@mentor.com>
Date:   Sat, 12 Sep 2020 09:50:22 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vfw1bJ+0pRJKVJ=nCJ-5rVzYLjkP4iWPqiG-it0qp5GFg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Andy

Thanks for your comment

On 2020/09/06 3:02, Andy Shevchenko wrote:
> 
> 
> On Thursday, September 3, 2020, Jiada Wang <jiada_wang@mentor.com 
> <mailto:jiada_wang@mentor.com>> wrote:
> 
>     From: Nick Dyer <nick.dyer@itdev.co.uk <mailto:nick.dyer@itdev.co.uk>>
> 
>     Some maXTouch chips (eg mXT1386) will not respond on the first I2C
>     request
>     when they are in a sleep state. It must be retried after a delay for the
>     chip to wake up.
> 
>     Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk
>     <mailto:nick.dyer@itdev.co.uk>>
>     Acked-by: Yufeng Shen <miletus@chromium.org
>     <mailto:miletus@chromium.org>>
> 
> 
>     (cherry picked from ndyer/linux/for-upstream commit
>     63fd7a2cd03c3a572a5db39c52f4856819e1835d)
> 
> 
> It’s a noise for upstream.
> 
sure, I will remove it

>     [gdavis: Forward port and fix conflicts.]
>     Signed-off-by: George G. Davis <george_davis@mentor.com
>     <mailto:george_davis@mentor.com>>
>     [jiada: return exact errno when i2c_transfer & i2c_master_send fails]
>     Signed-off-by: Jiada Wang <jiada_wang@mentor.com
>     <mailto:jiada_wang@mentor.com>>
>     ---
>       drivers/input/touchscreen/atmel_mxt_ts.c | 45 ++++++++++++++++--------
>       1 file changed, 30 insertions(+), 15 deletions(-)
> 
>     diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c
>     b/drivers/input/touchscreen/atmel_mxt_ts.c
>     index a2189739e30f..5d4cb15d21dc 100644
>     --- a/drivers/input/touchscreen/atmel_mxt_ts.c
>     +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
>     @@ -196,6 +196,7 @@ enum t100_type {
>       #define MXT_CRC_TIMEOUT                1000    /* msec */
>       #define MXT_FW_RESET_TIME      3000    /* msec */
>       #define MXT_FW_CHG_TIMEOUT     300     /* msec */
>     +#define MXT_WAKEUP_TIME                25      /* msec */
> 
> 
> Can we simple add _MS unit suffix to the definition?
As Dmitry commented, I'd like to keep it as-is, probably a separate 
patch to update all these together.
> 
> 
>       /* Command to unlock bootloader */
>       #define MXT_UNLOCK_CMD_MSB     0xaa
>     @@ -626,6 +627,7 @@ static int __mxt_read_reg(struct i2c_client *client,
>              struct i2c_msg xfer[2];
>              u8 buf[2];
>              int ret;
>     +       bool retry = false;
> 
> 
> Keep this ordered by length.
I will move "retry" upper.
> 
> 
>              buf[0] = reg & 0xff;
>              buf[1] = (reg >> 8) & 0xff;
>     @@ -642,17 +644,22 @@ static int __mxt_read_reg(struct i2c_client
>     *client,
>              xfer[1].len = len;
>              xfer[1].buf = val;
> 
>     -       ret = i2c_transfer(client->adapter, xfer, 2);
>     -       if (ret == 2) {
>     -               ret = 0;
>     -       } else {
>     -               if (ret >= 0)
>     -                       ret = -EIO;
>     -               dev_err(&client->dev, "%s: i2c transfer failed (%d)\n",
>     -                       __func__, ret);
>     +retry_read:
>     +       ret = i2c_transfer(client->adapter, xfer, ARRAY_SIZE(xfer));
>     +       if (ret != ARRAY_SIZE(xfer)) {
>     +               if (!retry) {
> 
> 
> Why not positive conditional?
to me, it's not much different either positive or negative conditional,
can you elaborate more about this?


> 
>     +                       dev_dbg(&client->dev, "%s: i2c retry\n",
>     __func__);
> 
> 
> __func__ is redundant for dev_dbg().
> 
>     +                       msleep(MXT_WAKEUP_TIME);
>     +                       retry = true;
>     +                       goto retry_read;
> 
>     +               } else {
> 
> 
> Redundant in either case of conditional. Allows to drop indentation level.
I will remove the redundant conditional

Thanks,
Jiada
> 
>     +                       dev_err(&client->dev, "%s: i2c transfer
>     failed (%d)\n",
>     +                               __func__, ret);
>     +                       return ret < 0 ? ret : -EIO;
>     +               }
>              }
> 
>     -       return ret;
>     +       return 0;
>       }
> 
> 
> Same comments about below.
> 
>       static int __mxt_write_reg(struct i2c_client *client, u16 reg, u16
>     len,
>     @@ -661,6 +668,7 @@ static int __mxt_write_reg(struct i2c_client
>     *client, u16 reg, u16 len,
>              u8 *buf;
>              size_t count;
>              int ret;
>     +       bool retry = false;
> 
>              count = len + 2;
>              buf = kmalloc(count, GFP_KERNEL);
>     @@ -671,14 +679,21 @@ static int __mxt_write_reg(struct i2c_client
>     *client, u16 reg, u16 len,
>              buf[1] = (reg >> 8) & 0xff;
>              memcpy(&buf[2], val, len);
> 
>     +retry_write:
>              ret = i2c_master_send(client, buf, count);
>     -       if (ret == count) {
>     -               ret = 0;
>     +       if (ret != count) {
>     +               if (!retry) {
>     +                       dev_dbg(&client->dev, "%s: i2c retry\n",
>     __func__);
>     +                       msleep(MXT_WAKEUP_TIME);
>     +                       retry = true;
>     +                       goto retry_write;
>     +               } else {
>     +                       dev_err(&client->dev, "%s: i2c send failed
>     (%d)\n",
>     +                               __func__, ret);
>     +                       ret = ret < 0 ? ret : -EIO;
>     +               }
>              } else {
>     -               if (ret >= 0)
>     -                       ret = -EIO;
>     -               dev_err(&client->dev, "%s: i2c send failed (%d)\n",
>     -                       __func__, ret);
>     +               ret = 0;
>              }
> 
>              kfree(buf);
>     -- 
>     2.17.1
> 
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
