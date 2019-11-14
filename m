Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAEAFFC2EA
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2019 10:46:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbfKNJq6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Nov 2019 04:46:58 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43502 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726319AbfKNJq6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Nov 2019 04:46:58 -0500
Received: by mail-oi1-f193.google.com with SMTP id l20so4679025oie.10;
        Thu, 14 Nov 2019 01:46:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jupibth4AdW/3F19cqSkX0Txs9Dy8Tl3OCXTvjmXQeg=;
        b=qVmmk/tZTQXh9+ckIzQyD9lZ3V+HMlfyQzgrl+Ba8T8PslFvzMW0qlzPrcOCZNnDpH
         RVxU3OK59MIb7C3pwDCdm66lDXBunvJ7oAMpuQ/v+RLMneEgqgnolu4aYgejHIl2hWtZ
         Xl4r3VnIyKQhIsebqVvyjxno78mXs7NWLLRZB9ogpsgw4nQI+RX/U+Oc28EnjICPlNAH
         KywVrSRVxE+2tqq5vI9rtFlbXfojibtJskfSorgdahKjd5sMdbNZKQgZQvwd/+h/GDZx
         383H80NVYynVaTbUgUzM3zlw2l+I5riyU0lI5M0FwtSwM7p56k9wDt7vwLgu3/WGdYGN
         hINA==
X-Gm-Message-State: APjAAAUmFjYLdRlwhfOczxlkX8Tv6OwhdsN3Id+5W6y2kuH3sEXYUUZ/
        F8sXvTiBrSvkM2Qy4MHcQn1V1HCXmswOhYEwO4FmEg==
X-Google-Smtp-Source: APXvYqysvbot+SV7FqjmYJm6Nhk4/FRKxTLMMFg9r2j85EDR5y/JrqvVp99vVccwyq+7SnkkHsRTgNY3MERRVIVw0Vg=
X-Received: by 2002:a05:6808:5d9:: with SMTP id d25mr1215824oij.54.1573724816497;
 Thu, 14 Nov 2019 01:46:56 -0800 (PST)
MIME-Version: 1.0
References: <20191023142521.3643152-1-arnd@arndb.de> <20191023152222.GP3125@piout.net>
 <50a48356-294d-516d-6448-ee06273fd014@gmx.de>
In-Reply-To: <50a48356-294d-516d-6448-ee06273fd014@gmx.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 14 Nov 2019 10:46:45 +0100
Message-ID: <CAMuHMdUSNrxQLYp5bzAQFcsaQfPZFRB-S1n+9XA3tSUt5DmP6g@mail.gmail.com>
Subject: Re: [PATCH] Input: hp_sdc_rtc - remove dead chardev code
To:     Helge Deller <deller@gmx.de>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

CC linux-m68k

On Thu, Oct 24, 2019 at 3:48 PM Helge Deller <deller@gmx.de> wrote:
> On 23.10.19 17:22, Alexandre Belloni wrote:
> > On 23/10/2019 16:25:02+0200, Arnd Bergmann wrote:
> >> The driver contains half of the implementation of /dev/rtc, but this
> >> was never completed, and it is now incompatible with the drivers/rtc
> >> framework.
> >>
> >> Remove the chardev completely. If anyone wants to add the functionality
> >> later, that shoudl be done through rtc_register_device().
> >>
> >> The remaining portions of the driver basically implement a single
> >> procfs file that may or may not be used anywhere. Not sure why this
> >> is in drivers/input/ though.
> >>
> >> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
>
> A year ago I did actually converted this driver to the RTC framework.
> But after some testing on my physical box (a 715/64 PA-RISC machine
> with HIL connector) I realized that the SDC in that machine doesn't
> provide a functional RTC, and even more important, on that box we don't
> need this RTC because the system provides a built-in RTC on-mainboard instead.
> So, I never pushed my changes upstream, which can still be found here:
> https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/commit/?h=hp_sdc_rtc_conversion&id=0d4250dbcfa2bb8b326ce7721e19e10a66f1eb92
>
> So, I don't think any PA-RISC machine needs this driver, and as such
> I'm happy to give my:
> Acked-by: Helge Deller <deller@gmx.de>
>
> I even think the whole driver can go away...
>
> Helge
>
> PS: Maybe some really old 68000-based HP machines needed that, but
> I don't know if any recent Linux kernel runs on those old boxes any
> longer...
>
>
> >> ---
> >>   drivers/input/misc/hp_sdc_rtc.c | 342 --------------------------------
> >>   1 file changed, 342 deletions(-)
> >>
> >> diff --git a/drivers/input/misc/hp_sdc_rtc.c b/drivers/input/misc/hp_sdc_rtc.c
> >> index abca895a6156..199bc17ddb1d 100644
> >> --- a/drivers/input/misc/hp_sdc_rtc.c
> >> +++ b/drivers/input/misc/hp_sdc_rtc.c
> >> @@ -53,28 +53,10 @@ MODULE_LICENSE("Dual BSD/GPL");
> >>
> >>   #define RTC_VERSION "1.10d"
> >>
> >> -static DEFINE_MUTEX(hp_sdc_rtc_mutex);
> >>   static unsigned long epoch = 2000;
> >>
> >>   static struct semaphore i8042tregs;
> >>
> >> -static hp_sdc_irqhook hp_sdc_rtc_isr;
> >> -
> >> -static struct fasync_struct *hp_sdc_rtc_async_queue;
> >> -
> >> -static DECLARE_WAIT_QUEUE_HEAD(hp_sdc_rtc_wait);
> >> -
> >> -static ssize_t hp_sdc_rtc_read(struct file *file, char __user *buf,
> >> -                           size_t count, loff_t *ppos);
> >> -
> >> -static long hp_sdc_rtc_unlocked_ioctl(struct file *file,
> >> -                                  unsigned int cmd, unsigned long arg);
> >> -
> >> -static unsigned int hp_sdc_rtc_poll(struct file *file, poll_table *wait);
> >> -
> >> -static int hp_sdc_rtc_open(struct inode *inode, struct file *file);
> >> -static int hp_sdc_rtc_fasync (int fd, struct file *filp, int on);
> >> -
> >>   static void hp_sdc_rtc_isr (int irq, void *dev_id,
> >>                          uint8_t status, uint8_t data)
> >>   {
> >> @@ -283,151 +265,6 @@ static inline int hp_sdc_rtc_read_ct(struct timespec64 *res) {
> >>      return 0;
> >>   }
> >>
> >> -
> >> -#if 0 /* not used yet */
> >> -/* Set the i8042 real-time clock */
> >> -static int hp_sdc_rtc_set_rt (struct timeval *setto)
> >> -{
> >> -    uint32_t tenms;
> >> -    unsigned int days;
> >> -    hp_sdc_transaction t;
> >> -    uint8_t tseq[11] = {
> >> -            HP_SDC_ACT_PRECMD | HP_SDC_ACT_DATAOUT,
> >> -            HP_SDC_CMD_SET_RTMS, 3, 0, 0, 0,
> >> -            HP_SDC_ACT_PRECMD | HP_SDC_ACT_DATAOUT,
> >> -            HP_SDC_CMD_SET_RTD, 2, 0, 0
> >> -    };
> >> -
> >> -    t.endidx = 10;
> >> -
> >> -    if (0xffff < setto->tv_sec / 86400) return -1;
> >> -    days = setto->tv_sec / 86400;
> >> -    if (0xffff < setto->tv_usec / 1000000 / 86400) return -1;
> >> -    days += ((setto->tv_sec % 86400) + setto->tv_usec / 1000000) / 86400;
> >> -    if (days > 0xffff) return -1;
> >> -
> >> -    if (0xffffff < setto->tv_sec) return -1;
> >> -    tenms  = setto->tv_sec * 100;
> >> -    if (0xffffff < setto->tv_usec / 10000) return -1;
> >> -    tenms += setto->tv_usec / 10000;
> >> -    if (tenms > 0xffffff) return -1;
> >> -
> >> -    tseq[3] = (uint8_t)(tenms & 0xff);
> >> -    tseq[4] = (uint8_t)((tenms >> 8)  & 0xff);
> >> -    tseq[5] = (uint8_t)((tenms >> 16) & 0xff);
> >> -
> >> -    tseq[9] = (uint8_t)(days & 0xff);
> >> -    tseq[10] = (uint8_t)((days >> 8) & 0xff);
> >> -
> >> -    t.seq = tseq;
> >> -
> >> -    if (hp_sdc_enqueue_transaction(&t)) return -1;
> >> -    return 0;
> >> -}
> >> -
> >> -/* Set the i8042 fast handshake timer */
> >> -static int hp_sdc_rtc_set_fhs (struct timeval *setto)
> >> -{
> >> -    uint32_t tenms;
> >> -    hp_sdc_transaction t;
> >> -    uint8_t tseq[5] = {
> >> -            HP_SDC_ACT_PRECMD | HP_SDC_ACT_DATAOUT,
> >> -            HP_SDC_CMD_SET_FHS, 2, 0, 0
> >> -    };
> >> -
> >> -    t.endidx = 4;
> >> -
> >> -    if (0xffff < setto->tv_sec) return -1;
> >> -    tenms  = setto->tv_sec * 100;
> >> -    if (0xffff < setto->tv_usec / 10000) return -1;
> >> -    tenms += setto->tv_usec / 10000;
> >> -    if (tenms > 0xffff) return -1;
> >> -
> >> -    tseq[3] = (uint8_t)(tenms & 0xff);
> >> -    tseq[4] = (uint8_t)((tenms >> 8)  & 0xff);
> >> -
> >> -    t.seq = tseq;
> >> -
> >> -    if (hp_sdc_enqueue_transaction(&t)) return -1;
> >> -    return 0;
> >> -}
> >> -
> >> -
> >> -/* Set the i8042 match timer (a.k.a. alarm) */
> >> -#define hp_sdc_rtc_set_mt (setto) \
> >> -    hp_sdc_rtc_set_i8042timer(setto, HP_SDC_CMD_SET_MT)
> >> -
> >> -/* Set the i8042 delay timer */
> >> -#define hp_sdc_rtc_set_dt (setto) \
> >> -    hp_sdc_rtc_set_i8042timer(setto, HP_SDC_CMD_SET_DT)
> >> -
> >> -/* Set the i8042 cycle timer (a.k.a. periodic) */
> >> -#define hp_sdc_rtc_set_ct (setto) \
> >> -    hp_sdc_rtc_set_i8042timer(setto, HP_SDC_CMD_SET_CT)
> >> -
> >> -/* Set one of the i8042 3-byte wide timers */
> >> -static int hp_sdc_rtc_set_i8042timer (struct timeval *setto, uint8_t setcmd)
> >> -{
> >> -    uint32_t tenms;
> >> -    hp_sdc_transaction t;
> >> -    uint8_t tseq[6] = {
> >> -            HP_SDC_ACT_PRECMD | HP_SDC_ACT_DATAOUT,
> >> -            0, 3, 0, 0, 0
> >> -    };
> >> -
> >> -    t.endidx = 6;
> >> -
> >> -    if (0xffffff < setto->tv_sec) return -1;
> >> -    tenms  = setto->tv_sec * 100;
> >> -    if (0xffffff < setto->tv_usec / 10000) return -1;
> >> -    tenms += setto->tv_usec / 10000;
> >> -    if (tenms > 0xffffff) return -1;
> >> -
> >> -    tseq[1] = setcmd;
> >> -    tseq[3] = (uint8_t)(tenms & 0xff);
> >> -    tseq[4] = (uint8_t)((tenms >> 8)  & 0xff);
> >> -    tseq[5] = (uint8_t)((tenms >> 16)  & 0xff);
> >> -
> >> -    t.seq =                 tseq;
> >> -
> >> -    if (hp_sdc_enqueue_transaction(&t)) {
> >> -            return -1;
> >> -    }
> >> -    return 0;
> >> -}
> >> -#endif
> >> -
> >> -static ssize_t hp_sdc_rtc_read(struct file *file, char __user *buf,
> >> -                           size_t count, loff_t *ppos) {
> >> -    ssize_t retval;
> >> -
> >> -        if (count < sizeof(unsigned long))
> >> -                return -EINVAL;
> >> -
> >> -    retval = put_user(68, (unsigned long __user *)buf);
> >> -    return retval;
> >> -}
> >> -
> >> -static __poll_t hp_sdc_rtc_poll(struct file *file, poll_table *wait)
> >> -{
> >> -        unsigned long l;
> >> -
> >> -    l = 0;
> >> -        if (l != 0)
> >> -                return EPOLLIN | EPOLLRDNORM;
> >> -        return 0;
> >> -}
> >> -
> >> -static int hp_sdc_rtc_open(struct inode *inode, struct file *file)
> >> -{
> >> -        return 0;
> >> -}
> >> -
> >> -static int hp_sdc_rtc_fasync (int fd, struct file *filp, int on)
> >> -{
> >> -        return fasync_helper (fd, filp, on, &hp_sdc_rtc_async_queue);
> >> -}
> >> -
> >>   static int hp_sdc_rtc_proc_show(struct seq_file *m, void *v)
> >>   {
> >>   #define YN(bit) ("no")
> >> @@ -507,182 +344,6 @@ static int hp_sdc_rtc_proc_show(struct seq_file *m, void *v)
> >>   #undef NY
> >>   }
> >>
> >> -static int hp_sdc_rtc_ioctl(struct file *file,
> >> -                        unsigned int cmd, unsigned long arg)
> >> -{
> >> -#if 1
> >> -    return -EINVAL;
> >> -#else
> >> -
> >> -        struct rtc_time wtime;
> >> -    struct timeval ttime;
> >> -    int use_wtime = 0;
> >> -
> >> -    /* This needs major work. */
> >> -
> >> -        switch (cmd) {
> >> -
> >> -        case RTC_AIE_OFF:       /* Mask alarm int. enab. bit    */
> >> -        case RTC_AIE_ON:        /* Allow alarm interrupts.      */
> >> -    case RTC_PIE_OFF:       /* Mask periodic int. enab. bit */
> >> -        case RTC_PIE_ON:        /* Allow periodic ints          */
> >> -        case RTC_UIE_ON:        /* Allow ints for RTC updates.  */
> >> -        case RTC_UIE_OFF:       /* Allow ints for RTC updates.  */
> >> -        {
> >> -            /* We cannot mask individual user timers and we
> >> -               cannot tell them apart when they occur, so it
> >> -               would be disingenuous to succeed these IOCTLs */
> >> -            return -EINVAL;
> >> -        }
> >> -        case RTC_ALM_READ:      /* Read the present alarm time */
> >> -        {
> >> -            if (hp_sdc_rtc_read_mt(&ttime)) return -EFAULT;
> >> -            if (hp_sdc_rtc_read_bbrtc(&wtime)) return -EFAULT;
> >> -
> >> -            wtime.tm_hour = ttime.tv_sec / 3600;  ttime.tv_sec %= 3600;
> >> -            wtime.tm_min  = ttime.tv_sec / 60;    ttime.tv_sec %= 60;
> >> -            wtime.tm_sec  = ttime.tv_sec;
> >> -
> >> -            break;
> >> -        }
> >> -        case RTC_IRQP_READ:     /* Read the periodic IRQ rate.  */
> >> -        {
> >> -                return put_user(hp_sdc_rtc_freq, (unsigned long *)arg);
> >> -        }
> >> -        case RTC_IRQP_SET:      /* Set periodic IRQ rate.       */
> >> -        {
> >> -                /*
> >> -                 * The max we can do is 100Hz.
> >> -             */
> >> -
> >> -                if ((arg < 1) || (arg > 100)) return -EINVAL;
> >> -            ttime.tv_sec = 0;
> >> -            ttime.tv_usec = 1000000 / arg;
> >> -            if (hp_sdc_rtc_set_ct(&ttime)) return -EFAULT;
> >> -            hp_sdc_rtc_freq = arg;
> >> -                return 0;
> >> -        }
> >> -        case RTC_ALM_SET:       /* Store a time into the alarm */
> >> -        {
> >> -                /*
> >> -                 * This expects a struct hp_sdc_rtc_time. Writing 0xff means
> >> -                 * "don't care" or "match all" for PC timers.  The HP SDC
> >> -             * does not support that perk, but it could be emulated fairly
> >> -             * easily.  Only the tm_hour, tm_min and tm_sec are used.
> >> -             * We could do it with 10ms accuracy with the HP SDC, if the
> >> -             * rtc interface left us a way to do that.
> >> -                 */
> >> -                struct hp_sdc_rtc_time alm_tm;
> >> -
> >> -                if (copy_from_user(&alm_tm, (struct hp_sdc_rtc_time*)arg,
> >> -                                   sizeof(struct hp_sdc_rtc_time)))
> >> -                       return -EFAULT;
> >> -
> >> -                if (alm_tm.tm_hour > 23) return -EINVAL;
> >> -            if (alm_tm.tm_min  > 59) return -EINVAL;
> >> -            if (alm_tm.tm_sec  > 59) return -EINVAL;
> >> -
> >> -            ttime.sec = alm_tm.tm_hour * 3600 +
> >> -              alm_tm.tm_min * 60 + alm_tm.tm_sec;
> >> -            ttime.usec = 0;
> >> -            if (hp_sdc_rtc_set_mt(&ttime)) return -EFAULT;
> >> -                return 0;
> >> -        }
> >> -        case RTC_RD_TIME:       /* Read the time/date from RTC  */
> >> -        {
> >> -            if (hp_sdc_rtc_read_bbrtc(&wtime)) return -EFAULT;
> >> -                break;
> >> -        }
> >> -        case RTC_SET_TIME:      /* Set the RTC */
> >> -        {
> >> -                struct rtc_time hp_sdc_rtc_tm;
> >> -                unsigned char mon, day, hrs, min, sec, leap_yr;
> >> -                unsigned int yrs;
> >> -
> >> -                if (!capable(CAP_SYS_TIME))
> >> -                        return -EACCES;
> >> -            if (copy_from_user(&hp_sdc_rtc_tm, (struct rtc_time *)arg,
> >> -                                   sizeof(struct rtc_time)))
> >> -                        return -EFAULT;
> >> -
> >> -                yrs = hp_sdc_rtc_tm.tm_year + 1900;
> >> -                mon = hp_sdc_rtc_tm.tm_mon + 1;   /* tm_mon starts at zero */
> >> -                day = hp_sdc_rtc_tm.tm_mday;
> >> -                hrs = hp_sdc_rtc_tm.tm_hour;
> >> -                min = hp_sdc_rtc_tm.tm_min;
> >> -                sec = hp_sdc_rtc_tm.tm_sec;
> >> -
> >> -                if (yrs < 1970)
> >> -                        return -EINVAL;
> >> -
> >> -                leap_yr = ((!(yrs % 4) && (yrs % 100)) || !(yrs % 400));
> >> -
> >> -                if ((mon > 12) || (day == 0))
> >> -                        return -EINVAL;
> >> -                if (day > (days_in_mo[mon] + ((mon == 2) && leap_yr)))
> >> -                        return -EINVAL;
> >> -            if ((hrs >= 24) || (min >= 60) || (sec >= 60))
> >> -                        return -EINVAL;
> >> -
> >> -                if ((yrs -= eH) > 255)    /* They are unsigned */
> >> -                        return -EINVAL;
> >> -
> >> -
> >> -                return 0;
> >> -        }
> >> -        case RTC_EPOCH_READ:    /* Read the epoch.      */
> >> -        {
> >> -                return put_user (epoch, (unsigned long *)arg);
> >> -        }
> >> -        case RTC_EPOCH_SET:     /* Set the epoch.       */
> >> -        {
> >> -                /*
> >> -                 * There were no RTC clocks before 1900.
> >> -                 */
> >> -                if (arg < 1900)
> >> -              return -EINVAL;
> >> -            if (!capable(CAP_SYS_TIME))
> >> -              return -EACCES;
> >> -
> >> -                epoch = arg;
> >> -                return 0;
> >> -        }
> >> -        default:
> >> -                return -EINVAL;
> >> -        }
> >> -        return copy_to_user((void *)arg, &wtime, sizeof wtime) ? -EFAULT : 0;
> >> -#endif
> >> -}
> >> -
> >> -static long hp_sdc_rtc_unlocked_ioctl(struct file *file,
> >> -                                  unsigned int cmd, unsigned long arg)
> >> -{
> >> -    int ret;
> >> -
> >> -    mutex_lock(&hp_sdc_rtc_mutex);
> >> -    ret = hp_sdc_rtc_ioctl(file, cmd, arg);
> >> -    mutex_unlock(&hp_sdc_rtc_mutex);
> >> -
> >> -    return ret;
> >> -}
> >> -
> >> -
> >> -static const struct file_operations hp_sdc_rtc_fops = {
> >> -        .owner =            THIS_MODULE,
> >> -        .llseek =           no_llseek,
> >> -        .read =                     hp_sdc_rtc_read,
> >> -        .poll =                     hp_sdc_rtc_poll,
> >> -        .unlocked_ioctl =   hp_sdc_rtc_unlocked_ioctl,
> >> -        .open =                     hp_sdc_rtc_open,
> >> -        .fasync =           hp_sdc_rtc_fasync,
> >> -};
> >> -
> >> -static struct miscdevice hp_sdc_rtc_dev = {
> >> -        .minor =    RTC_MINOR,
> >> -        .name =             "rtc_HIL",
> >> -        .fops =             &hp_sdc_rtc_fops
> >> -};
> >> -
> >>   static int __init hp_sdc_rtc_init(void)
> >>   {
> >>      int ret;
> >> @@ -696,8 +357,6 @@ static int __init hp_sdc_rtc_init(void)
> >>
> >>      if ((ret = hp_sdc_request_timer_irq(&hp_sdc_rtc_isr)))
> >>              return ret;
> >> -    if (misc_register(&hp_sdc_rtc_dev) != 0)
> >> -            printk(KERN_INFO "Could not register misc. dev for i8042 rtc\n");
> >>
> >>           proc_create_single("driver/rtc", 0, NULL, hp_sdc_rtc_proc_show);
> >>
> >> @@ -710,7 +369,6 @@ static int __init hp_sdc_rtc_init(void)
> >>   static void __exit hp_sdc_rtc_exit(void)
> >>   {
> >>      remove_proc_entry ("driver/rtc", NULL);
> >> -        misc_deregister(&hp_sdc_rtc_dev);
> >>      hp_sdc_release_timer_irq(hp_sdc_rtc_isr);
> >>           printk(KERN_INFO "HP i8042 SDC + MSM-58321 RTC support unloaded\n");
> >>   }
> >> --
> >> 2.20.0
